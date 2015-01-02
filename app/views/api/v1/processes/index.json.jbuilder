json.processes @processes do |p|

  json.id p.id
  json.process_type p.process_type
  if p.created_at.year != Date.today.year
    json.started_at p.created_at.strftime("%F %H:%M")
  else
    json.started_at p.created_at.strftime("%m-%d %H:%M")
  end
  json.requester "#{p.user.first_name} #{p.user.last_name}"

end
