p = process

status = "not_started"
status = p.current.type if p.current
status = "finished" if p.finished_at

json.name p.name
json.humanName p.name.humanize
json.id p.id
json.description p.description
json.created_at p.created_at
json.runned_at p.runned_at
json.finished_at p.finished_at
json.pid p.pid
json.status status

json.head p.heads do |h|
  json.id h.id
  a = h.action
  if a
    json.action do
      json.id a.id   
      json.name a.name
      json.human_name a.name.humanize
      json.process_id a.process_id        
      json.description a.description
      json.question a.question
      json.type a.type         
      json.head p.try(:current).try(:id) == a.id

      json.following a.next_actions.each do |flw|
        json.name flw.ending
        json.human_name flw.ending.try(:humanize)
        json.id flw.id
      end  

      json.tasks a.tasks do |t|

        task_status = "not_assigned"
        task_status = "assigned" if(t.assignee_id)
        task_status = "finished" if(t.finished_at)

        json.name t.name
        json.human_name t.name.humanize
        json.id t.id
        json.assignee_id t.assignee_id
        json.assignee User.find(t.assignee_id).name if t.assignee_id
        json.finished_at t.finished_at
        json.status task_status
      end  
    end
  end
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
    json.human_name t.name.humanize
    json.id t.id
    json.assignee_id t.assignee_id
    json.assignee User.find(t.assignee_id).name if t.assignee_id
    json.finished_at t.finished_at
  end
  
end
