
process "sample_process" do

  description "sample_process"
  
  start "action_1"

  task_action "action_1" do

    description "1st action"
    task "first_task_1", roles: ["storage", "kitchen"], description: "optional description", auto_assign: true
    task "first_task_2", roles: ["storage", "kitchen"]
    task "first_task_2", roles: ["storage"]

    next_action "action_2"

  end

  task_action "action_2" do

    description "get enaugh eggs, bacon and bread"
    task "second_task_1", roles: ["storage", "kitchen"], description: "optional description", auto_assign: true
    task "second_task_2", roles: ["storage", "kitchen"]
    task "second_task_3", roles: ["storage"]

    next_action "action_3"

  end

  task_action "action_3" do

    description "sets stove, fry eggs, roast bacon"
    
    task "third_task_1", roles: ["kitchen"]

    next_action "action_4"
    
  end

  task_action "action_4" do

    task "fourth_task_1", roles: ["servers"]
    task "fourth_task_2", roles: ["kitchen"]

    next_action "process:finish"

  end


end
