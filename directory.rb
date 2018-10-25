@students = []

def print_menu
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
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
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def show_students
  if !@students.empty?
    print_header
    print_students_list
    print_footer
  else
    puts "There are no students"
  end 
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  name = ""
  name_input = gets.strip
  
  check_name = Proc.new { |name_to_check|
    while true do
      # pattern = [-'a-zA-Z\s]
      name = name_to_check; break if name_to_check.match?(/[-'a-zA-Z\s]/) || name_to_check == ""
      puts "Please ensure you have entered the student's name correctly."
      name_to_check = gets.strip
    end
  }
  
  check_name.call(name_input)
  
  # set up cohort variable and get the cohort
  cohort = ""
  puts "Please enter the student's cohort"
  month = gets.capitalize.strip
  
  check_month = Proc.new { |month_to_check|
    # create an array of months
    months = ["January", "February", "March", "April", "May", "June", "July", 
  "August", "September", "October", "November", "December"]

    while true do
      cohort = month_to_check; break if months.include?(month_to_check)
      cohort = :November; break if month_to_check == "" || month_to_check == nil
      puts "Please enter the student's cohort correctly"
      month_to_check = gets.capitalize.strip
    end
  }
  
  check_month.call(month)
  
  # while the name is not empty, repeat this code
  while !name.empty? && !cohort.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    # get another set of student data from the user
    puts "Please enter the name of the student"
    name = ""
    name_input = gets.strip
    check_name.call(name_input)
    # set up cohort variable and get the cohort
    cohort = ""
    puts "Please enter the student's cohort"
    month = gets.capitalize.strip
    check_month.call(month)
  end

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

# nothing happens until we call the methods

interactive_menu
