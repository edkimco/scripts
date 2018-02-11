#!/bin/bash

# $1 = PROJECT NAME
# $2 = USERNAME
# $3 = PASSWORD

cat ./issues | while read LINE

do
	name="$(echo $LINE | cut -d';' -f1)"
	color="$(echo $LINE | cut -d';' -f2)"

	curl \
	-H "Content-Type: application/json" \
	-d '{"name": "'"$name"'", "color": "'"$color"'"}' \
	https://api.github.com/repos/edkimco/$1/labels \
	-u "$2:$3"
done
