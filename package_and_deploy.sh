#! /bin/bash
set -e
OUTPUT_FOLDER='builds'
CURRENT_REVISION=`git rev-parse --short  HEAD`
OUTPUT_FILE="$OUTPUT_FOLDER/blog-$CURRENT_REVISION.tar.gz"
echo "Building application"
hugo --theme=herring-cove
tar -zcf $OUTPUT_FILE  public
echo "Application saved to $OUTPUT_FILE"
cp $OUTPUT_FILE builds/latest.tar.gz
echo "Deploying app"
# ansible-playbook -i provision/inv.ini provision/app.yml 