#!/bin/bash

# the json command here is an npm package
#: here it is: https://www.npmjs.com/package/json

echo 'Login using the terminal'

read -p "Username: " username
read -sp "Password: " pass
echo ""

if [ $username ] && [ $pass ]; then
	echo 'Your login credetials are correct!'
	echo 'Welcome Mohammed'
else
	echo "Sorry, your data doesn't match"
fi

