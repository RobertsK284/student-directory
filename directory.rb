def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = ""
  name_input = gets.chomp
  
  check_name = Proc.new { |name_to_check|
    while true do
      # pattern = [-'a-zA-Z\s]
      name = name_to_check; break if name_to_check.match?(/[-'a-zA-Z\s]/) || name_to_check == ""
      puts "Please ensure you have entered the student's name correctly."
      name_to_check = gets.chomp
    end
  }
  
  check_name.call(name_input)
  
  # set up cohort variable and get the cohort
  cohort = ""
  puts "Please enter the student's cohort"
  month = gets.capitalize.chomp
  
  check_month = Proc.new { |month_to_check|
    # create an array of months
    months = ["January", "February", "March", "April", "May", "June", "July", 
  "August", "September", "October", "November", "December"]

  while true do
    cohort = month_to_check; break if months.include?(month_to_check)
    cohort = :November; break if month_to_check == "" || month_to_check == nil
    puts "Please enter the student's cohort correctly"
    month_to_check = gets.capitalize.chomp
  end
  }
  
  check_month.call(month)
  
  # while the name is not empty, repeat this code
  while !name.empty? && !cohort.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another set of student data from the user
    puts "Please enter the name of the student"
    name = ""
    name_input = gets.chomp
    check_name.call(name_input)
    # set up cohort variable and get the cohort
    cohort = ""
    puts "Please enter the student's cohort"
    month = gets.capitalize.chomp
    check_month.call(month)
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end 

def print_dir(students)
  lineWidth = 70 
  students.each do |student|
    puts "#{student[:name]}".center(lineWidth)
    puts "(#{student[:cohort]} cohort)\n".center(lineWidth)
  end
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

students = input_students

# nothing happens until we call the methods
print_header
print_dir(students)
print_footer(students)