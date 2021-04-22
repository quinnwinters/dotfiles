#!/usr/bin/env bash

packages=(eslint generator-github-action generator-lambda-typescript generator-py gtop highlight pen speed-test wifi-password-cli yo)

for package in "$packages"; do
    npm list -g "$package"
    if [[ $? != 0 ]]; then
        npm install -g "$package"
    fi
done

npm update -g
