# "This is a programme that displays its own code."

File.open(__FILE__, "r") { |file|
  file.readlines.each do |line|
    puts line
  end
}
