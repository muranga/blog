module.exports = {
  content: ["content/**/*.md", "layouts/**/*.html" , "themes/nam/layouts/**/*.html"],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
