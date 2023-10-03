#!/bin/sh

# Build site
bundle exec jekyll serve

# Upload to server if commit message provided
if [ -n "$1" ]; then
  echo -e "\nUpdating private repo..."
  echo -e ">>>>>>>>>>>>>>>>>>>>>>>>\n"
  git add .
  git commit -m "$1"
  git push
  echo -e "\nUpdating public repo..."
  echo -e ">>>>>>>>>>>>>>>>>>>>>>>>\n"
  cd ../cakeyan.github.io
  git pull
  rm -rf *
  cp -r ../website_new/_site/* ./
  rm another-page.html
  rm deploy.sh
  rm LICENSE
  rm jekyll-theme-minimal.gemspec
  git add .
  git commit -m "$1"
  git push
  echo -e "\nSuccess!"
fi