if @user
	json.message "good credentials"
	json.error false
	json.error_message false
	json.data do	
		json.id @user.id
		json.username @user.username
		json.first_name @user.first_name
		json.last_name @user.last_name
		json.api_key @user.api_key
	end
else
	json.message "bad credentials"
	json.error true
	json.error_message "bad credentials"
	json.data {}
end
