latest_blueprints = {}
@processes[:blueprints].each { |item| latest_blueprints[item.name] = item.values[:latest] }
process_hash = @processes[:processes].group_by(&:name)

json.array! process_hash.each do |k, v|
	json.name k
	json.latest latest_blueprints[k]
	json.processes v
end
