json.id @process.id
json.type @process.process_type
json.requester "#{@process.user.first_name} #{@process.user.last_name}"

if @process.created_at.year != Date.today.year
  json.started_at @process.created_at.strftime("%F %H:%M")
else
  json.started_at @process.created_at.strftime("%m-%d %H:%M")
end

json.comments @process.process_comments do |c|
  json.user c.user.name
  json.text c.text
  json.comment_id c.id
end