#!/bin/sh -l

TARGET=$(sh ./find_target.rb)

cd $HOME

merges=$(git log $TARGET.. --merges --pretty=format:'* %s --- %b' \
  | sed -E 's/Merge pull request (.*) from .* --- /\1: /g' \
  | grep -v -- '---')

cd -

sh ./make_comment.rb merges