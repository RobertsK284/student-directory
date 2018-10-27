@students = []

def main_program
  loop do
    print_menu
    menu_navigation(STDIN.gets.chomp)
  end
end

def print_menu
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def menu_navigation(selection)
  case selection
    when "1"
      # input the student
      input_students
    when "2"
      # show the students
      show_students
    when "3"
      load_or_save = "save to" 
      choose_filename(load_or_save) # asks user to choose a save filename
      save_students # will save to the user's chosen file
    when "4"
      load_or_save = "load from"
      choose_filename(load_or_save) # asks user to choose a load filename
      load_students # will load from the user's chosen file
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  # while the name is not empty, repeat this code
  while true do
    # get the name
    puts "Please enter the name of the student"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    break if name.empty?
    # add the student hash to the array
    cohort = :november
    add_to_hash(name, cohort)
    puts "Now we have #{@students.count} students"
  end
end

def add_to_hash(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------------------"
end 

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def choose_filename(load_or_save)
  puts "What file would you like to #{load_or_save}?"
  @filename = STDIN.gets.chomp
end

def save_students
  # open the file for writing
  File.open(@filename, "w") { |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  } # file = File.open(@filename, "w")
  
  if @students.count == 0
    puts "There were no student records to save"
  else
    @students.count == 1 ? plural_or_single = "" : plural_or_single = "s"
    puts "Saved #{@students.count} record#{plural_or_single} to #{@filename}"
  end
end

def load_students 
  @students = []
  
  File.open(@filename, "r") {|file|
  if !File.zero?(@filename)
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_to_hash(name, cohort)
    end
  end
  } # File.open(@filename, "r")
  
  if @students.count > 0
    puts "Loaded #{@students.count} from #{@filename}"
  else 
    puts "There were no students in #{@filename}"
  end
end

def load_students_at_startup
  @filename = ARGV.first # first argument from the command line
  if @filename.nil? # if no file given but students.csv exists in the folder
    @filename = "students.csv"
  end  
  
  if File.exists?(@filename) # if file exists
     load_students
  else # if it doesn't exist
    puts "Sorry, #{@filename} doesn't exist, can't load students."
    exit # quit the program
  end
end
# nothing happens until we call the methods

load_students_at_startup
main_program