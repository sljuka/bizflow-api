json.array! @processes.each do |process|
	json.id process.id
	json.name process.name
	json.description process.description
end
