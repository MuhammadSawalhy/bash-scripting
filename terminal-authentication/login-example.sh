#! /bin/bash

# the json command here is an npm package
#: here it is: https://www.npmjs.com/package/json

echo 'Login using the terminal'

read -p "Username: " username
read -sp "Password: " pass
echo ""

all_users=$(cat ./users.json)
count=$(echo $all_users | json length)

for (( i=0; i<=count; i++ )); do
	if [ $i -lt $count ]; then
		data_username=$(echo $all_users | json "$i.username")
		data_password=$(echo $all_users | json "$i.password")
		if [ $username = $data_username ] && [ $pass = $data_password ]; then
			echo "Your login credetials are correct!"
			echo "Welcome $username"
			break
		fi
	else
		echo "Sorry, your data doesn't match"
		return 1
	fi
done


