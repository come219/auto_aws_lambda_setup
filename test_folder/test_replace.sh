#!/bin/bash

# Define the JSON file and the word to be replaced
json_file='test_word.json'
old_word='old_word'
new_word='new_word'

# Use jq to perform the replacement
jq "gsub(\"$old_word\";\"$new_word\")" $json_file > temp.json

# Overwrite the original file with the modified version
mv temp.json $json_file
