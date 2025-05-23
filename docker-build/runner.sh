#!/bin/bash

echo 'build static html dir under ../_site/'
cd "$(dirname "$0")"

touch $PWD/../Gemfile.lock  # Make sure it exists
chmod 666 $PWD/../Gemfile.lock

export JEKYLL_VERSION=4
docker run --rm \
  --volume="$PWD/..:/srv/jekyll:Z" \
  -it jekyll/builder:$JEKYLL_VERSION \
  jekyll build