json.id @process.id
json.name @process.name
if @process.created_at.year != Date.today.year
json.started_at @process.created_at.strftime("%F %H:%M")
else
json.started_at @process.created_at.strftime("%m-%d %H:%M")
end
json.requester_id "#{@process.creator_id}"
json.runned_at "#{@process.runned_at}"
json.runner_id "#{@process.runner_id}"