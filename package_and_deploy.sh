#! /bin/bash
set -e
OUTPUT_FOLDER='builds'
mkdir -p $OUTPUT_FOLDER
CURRENT_REVISION=`git rev-parse --short  HEAD`
OUTPUT_FILE="$OUTPUT_FOLDER/blog-$CURRENT_REVISION.tar.gz"
hugo
tar -zcf $OUTPUT_FILE  public
cp $OUTPUT_FILE builds/blog-latest.tar.gz
ansible-playbook -vvv -i deploy/inv.ini deploy/blog.yml 