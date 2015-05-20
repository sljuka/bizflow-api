# this file initializes the bizflow
db_path = Rails.root.join('bizflow_db', 'bf.db')
Bizflow::Repos::Repo.connect(db_path)
puts "Bizflow: Initialized"