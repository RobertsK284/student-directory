def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
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
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} student" if students.count == 1
    puts "Now we have #{students.count} students" if students.count != 1
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
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end 

def print_dir(students)

# create array of cohorts
  months = students.map {|s| s[:cohort] }
  months.uniq!
 
  # go through the months array and see if a month matches anything in the 
  # cohort key in the students array

  months.each do |month|
    # get list of students matching the month
    student_list = students.select { |student| student[:cohort] == month }
    
    # get list of student names
    student_list.map! { |student| student[:name] }
      puts month
      puts student_list.join(", ")
  end  
end  

def print_footer(names)
  puts "Overall, we have #{names.count} great students" if names.count != 1
  puts "Overall, we have #{names.count} great student" if names.count == 1
end

students = input_students

# nothing happens until we call the methods
print_header

print_dir(students)
print_footer(students)