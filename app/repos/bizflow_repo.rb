class BizflowRepo

  # process

  def create_process(hash)
    BfProcess.create(hash)
  end

  def find_process(id)
    BfProcess.find(id)
  end

  def query_processes(hash)
    BfProcess.where(hash)
  end

  # task

  def create_task(hash)
    Task.create(hash)
  end

  def find_task(id)
    Task.find(id)
  end

  def query_tasks(hash)
    Task.where(hash)
  end

end
