def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp

  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the name of the student"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end 

def print_dir(students)
  index = 0
	  while index < students.length
	    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
	    index += 1
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