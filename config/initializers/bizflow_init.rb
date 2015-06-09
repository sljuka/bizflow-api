# this file initializes the bizflow
db_path = Rails.root.join("bizflow_db", "bf-#{Rails.env}.db")
Bizflow::Repos::Repo.connect(db_path)
puts "Bizflow initialized, using bf-#{Rails.env}.db database"