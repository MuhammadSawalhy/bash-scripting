#!/bin/bash

# the json command here is an npm package
#: here it is: https://www.npmjs.com/package/json

echo 'Please fill in youe data!'
read -p 'username: ' username
read -p 'email: ' email
read -sp 'password: ' pass1
read -sp 'password again: ' pass2 
echo ''

if [ $pass1 != $pass2 ]; then
	echo 'you passwrod_1 does not match password_2'
	exit 1
fi

data="{username: \"$username\", password: \"$pass1\", email: \"$email\"}"

echo ''
echo 'saving data...'

all_users=$([ -e ./users.json ] && cat users.json || echo '[]')
if [ -z $all_users ]; then all_users='[]'; fi
count=$(echo $all_users | json length);

all_users=$(echo $all_users | json -A -e "this[$count] = $data" > users.json) && 
	echo "new user \"$username\" added!"
