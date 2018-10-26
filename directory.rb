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
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
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

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  if @students.count == 0
    puts "There were no student records to save"
  else
    @students.count == 1 ? plural_or_single = "" : plural_or_single = "s"
    puts "Saved #{@students.count} record#{plural_or_single} to students.csv"
  end
  file.close
end

def load_students(filename = "students.csv") 
  file = File.open(filename, "r")
  if !File.zero?(filename)
    @students = []
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_to_hash(name, cohort)
    end
    if @students.count > 0
      puts "Loaded #{@students.count} from #{filename}"
    else 
      puts "There were no students in #{filename}"
    end
  end
  file.close
end

def load_students_at_startup
  filename = ARGV.first # first argument from the command line
  if filename.nil? || File.exists?(filename) # if no file given or if it exists
    filename ||= "students.csv"
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
# nothing happens until we call the methods

load_students_at_startup
main_program