grouped_processes = @processes.group_by(&:name)

json.array! @blueprints.each do |bp|
	json.name bp.name
	json.humanName bp.name.humanize
	json.id bp.id
	json.description bp.description
	json.processes grouped_processes[bp.name] || []
end
