require_relative "../processes/test"

class Test2 < Test

  @dir = File.expand_path(__dir__)

end

puts Test2.new.root
