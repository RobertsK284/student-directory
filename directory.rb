@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      # input the student
      input_students
    when "2"
      # show the students
      show_students
    when "3"
      save_students
    when "4"
      load_students # will load from students.csv by default
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  name = STDIN.gets.chomp
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    cohort = :november
    add_to_hash(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another set of student data from the user
    puts "Please enter the name of the student"
    name = STDIN.gets.chomp
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

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv") 
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_to_hash(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? || File.exists?(filename)
    filename ||= "students.csv"
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
# nothing happens until we call the methods

try_load_students
interactive_menu
