class BizflowRepo < Bizflow::Repo

  Databases = {
  	dev: Rails.root.join('bizflow_db', 'bf.db')
  }

  def db_path
  	Databases[:dev]
  end

end
