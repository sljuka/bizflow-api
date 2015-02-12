json.array! @tasks.each do |task|
	json.id task.id
	json.name task.name
	json.assignee task.assignee_id
end
