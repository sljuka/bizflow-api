class Test

  ConfigFileName = "bizflow_config.rb"

  def self.file
    @dir
  end

  def root
    dir = self.class.file
    #puts "1 #{dir}"
    10.times do |i|
      files = Dir["#{dir}/*.rb"].map { |path| File.basename(path) }
      #puts "2 #{files}"
      break if(files.include?(ConfigFileName))
      dir = File.expand_path("../", dir)
      #puts "1 #{dir}"
      raise "Unable to locate root directory" if i >= 9
    end

    dir
  end
end
