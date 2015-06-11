namespace :refresh do
  desc "Returns the database to a default state"
  task :database => :environment do
  
    puts "restoring data to default state...";

    if(User.any?)
      user = User.first
    else
      user = User.create(email: "test@bizflow.com", username: "test", password: "test")
    end

    Bizflow::DataModel::Task.dataset.delete
    Bizflow::DataModel::Head.dataset.delete
    Bizflow::DataModel::NextAction.dataset.delete
    Bizflow::DataModel::Action.dataset.delete
    Bizflow::DataModel::Process.dataset.delete

    builder = Bizflow::Lib::ProcessBuilder.new

    blueprint = Bizflow::DataModel::ProcessBlueprint.first
    builder.build(blueprint.id, user.id)
    builder.build(blueprint.id, user.id)
    builder.build(blueprint.id, user.id)

    puts Bizflow::DataModel::Process.count

    puts "restoring finished #{Rails.env} ** #{Bizflow::DataModel::Process.all}"


  end

end