def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # get hobby
  puts "Please enter the student's hobby"
  hobby = gets.chomp
  # get country of birth
  puts "Please enter the student's country of birth"
  country = gets.chomp
  # get height
  puts "Please enter the student's height"
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? && !hobby.empty? && !country.empty? && !height.empty? do
    # add the student hash to the array
    students << {name: name, hobby: hobby, country: country, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another set of student data from the user
    puts "Please enter the name of the student"
    name = gets.chomp
    puts "Please enter the student's hobby"
    hobby = gets.chomp
    puts "Please enter the student's country of birth"
    country = gets.chomp
    puts "Please enter the student's height"
    height = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end 

def print_dir(students)
  students.each do |student|
    puts "#{student[:name]}, hobby: #{student[:hobby]}, country of birth: #{student[:country]}, height: #{student[:height]}, (#{student[:cohort]} cohort)"
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