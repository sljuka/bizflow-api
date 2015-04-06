grouped_processes = @processes.group_by(&:name)

json.array! @blueprints.each do |bp|
  json.name bp.name
  json.humanName bp.name.humanize
  json.id bp.id
  json.description bp.description

  bp_processes = grouped_processes[bp.name] || []
  json.processes bp_processes do |p|

    status = "not_started"
    status = p.current.type if p.current
    status = "finished" if p.finished_at

    json.name p.name
    json.human_name p.name.humanize
    json.created_at p.created_at
    json.creator_id p.creator_id           
    json.description p.description             
    json.finished_at p.finished_at             
    json.id p.id              
    json.jumped_at p.jumped_at             
    json.pid p.pid             
    json.process_blueprint_id p.process_blueprint_id
    json.runned_at p.runned_at          
    json.runner_id p.runner_id
    json.status status
  end
end
