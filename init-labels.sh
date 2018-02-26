#!/bin/bash

# $1 = PROJECT NAME
# $2 = USERNAME
# $3 = PASSWORD

cat ./src/issues | while read ISSUE
do
	name="$(echo $ISSUE | cut -d';' -f1)"
	color="$(echo $ISSUE | cut -d';' -f2)"

	curl \
	-H "Content-Type: application/json" \
	-d '{"name": "'"$name"'", "color": "'"$color"'"}' \
	https://api.github.com/repos/edkimco/$1/labels \
	-u "$2:$3";
done

cat ./src/issues-to-remove | while read ISSUE_TO_REMOVE
do
	name="$(echo $ISSUE_TO_REMOVE)"

	curl \
	-X DELETE \
	-H "Content-Type: application/json" \
	"https://api.github.com/repos/edkimco/$1/labels/$name" \
	-u "$2:$3" \
	-f;
done
