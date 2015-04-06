p = @process

json.name p.name
json.humanName p.name.humanize
json.id p.id
json.description p.description
json.created_at p.created_at
json.runned_at p.runned_at
json.pid p.pid

json.head p.heads do |h|
  json.id h.id
  json.action h.action
end

json.actions p.actions do |a|
          
  json.id a.id   
  json.name a.name
  json.human_name a.name.humanize
  json.process_id a.process_id        
  json.description a.description             
  json.type a.type         
  json.head p.try(:current).try(:id) == a.id     

  json.tasks a.tasks do |t|
    json.name t.name
  end
end
