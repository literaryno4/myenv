#!/bin/bash

path=$(pwd)
for dotfile in $(find . -name '.*' | grep -v .git | grep -v '^.$');
do
  bn=$(basename ${dotfile})
  ln -sf ${path}/${bn} $HOME/${bn}
done
