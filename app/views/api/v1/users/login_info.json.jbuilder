if @user
	json.message "Good creds, here's a token"
	json.data do	
		json.id @user.id
		json.username @user.username
		json.first_name @user.first_name
		json.last_name @user.last_name
		json.api_key @user.api_key.token
	end
else
	json.message "Bad credentials!"
	json.error true
	json.data {}
end
