class BizflowRepo < Bizflow::Repo

  def db_path
    File.expand_path "#{__FILE__}/../../../bizflow_db/bd.db"
  end

end
