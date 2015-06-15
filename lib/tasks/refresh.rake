namespace :refresh do
  desc "Returns the database to a default state"
  task :database => :environment do
  
    puts "restoring data to default state...";

    if(User.any?)
      user = User.first
    else
      user = User.new(email: "test@bizflow.com", username: "test", password: "test")
      user.save
    end

    Bizflow::DataModel::Task.dataset.delete
    Bizflow::DataModel::Head.dataset.delete
    Bizflow::DataModel::NextAction.dataset.delete
    Bizflow::DataModel::Action.dataset.delete
    Bizflow::DataModel::Process.dataset.delete

    builder = Bizflow::Lib::ProcessBuilder.new

    blueprints = Bizflow::DataModel::ProcessBlueprint.first(4)

    process1 = builder.build(blueprints[0].id, user.id)
    process2 = builder.build(blueprints[0].id, user.id)
    process3 = builder.build(blueprints[0].id, user.id)

    process1.start(user.id) do |on|
      on.success { |res| }
      on.already_started { |res| }
    end

    process1 = builder.build(blueprints[1].id, user.id)
    process2 = builder.build(blueprints[1].id, user.id)
    process3 = builder.build(blueprints[1].id, user.id)    

    process1.start(user.id) do |on|
      on.success { |res| }
      on.already_started { |res| }
    end

    process2.start(user.id) do |on|
      on.success { |res| }
      on.already_started { |res| }
    end

    process1 = builder.build(blueprints[2].id, user.id)
    process2 = builder.build(blueprints[2].id, user.id)

    process1 = builder.build(blueprints[3].id, user.id)
    process2 = builder.build(blueprints[3].id, user.id)

    process2.start(user.id) do |on|
      on.success { |res| }
      on.already_started { |res| }
    end

    puts "restoring finished #{Rails.env} ** #{Bizflow::DataModel::Process.all}"


  end

end