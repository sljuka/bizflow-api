json.array! @blueprints.each do |bp|
	json.id bp.id
	json.name bp.name
	json.description bp.description
end
