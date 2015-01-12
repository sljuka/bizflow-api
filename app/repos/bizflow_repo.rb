class BizflowRepo

  def db_path
    File.expand_path "#{__FILE__}/../../../bizflow_db/bd.db"
  end

  def process_wrapers
    {
      make_breakfast: MakeBreakfastProcess
    }
  end

end

puts BizflowRepo.new.db_path