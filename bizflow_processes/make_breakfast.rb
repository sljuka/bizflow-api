process "make_breakfast" do

  description "creates breakfast"
  
  start_action "get_supplies"

  task_action "get_supplies" do

    description "get enaugh eggs, bacon and bread"
    task "get_bacon", roles: ["storage", "kitchen"], description: "optional description", auto_assign: true
    task "get_eggs", roles: ["storage", "kitchen"]
    task "get_bread", roles: ["storage"]

    next_action "make_breakfast"

  end

  task_action "make_breakfast" do

    description "make eggs and bacon"
    task "make_breakfast", roles: ["storage", "kitchen"], description: "optional description", auto_assign: true

    next_action "make_breakfast"

  end

  task_action "serve_breakfast" do

    description "prepare table, slice bread"
    task "prepare_table", roles: ["servers"]
    task "slice_bread", roles: ["kitchen"]

    next_action "process:finish"

  end

end
