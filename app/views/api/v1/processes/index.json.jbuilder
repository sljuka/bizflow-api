json.processes @processes do |p|

  json.id p.id
  json.name p.name
  if p.created_at.year != Date.today.year
    json.started_at p.created_at.strftime("%F %H:%M")
  else
    json.started_at p.created_at.strftime("%m-%d %H:%M")
  end
  json.requester_id "#{p.creator_id}"

end
