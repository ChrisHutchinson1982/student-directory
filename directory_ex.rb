def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "See full cohort below"
  students.each_with_index do |student, index|
    # print a number before the name and cohort of each student
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_with_c(students)
  puts "See cohort with names beginning with C"
  students.each_with_index do |student, index|
    # print only if name begins with C
    if student[:name][0] == "C"
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" 
    end
  end
end

def print_less_than_twelve(students)
  puts "See cohort with names less than 12 characters"
  students.each_with_index do |student, index|
    # print only if name is less than 12 chars
    if student[:name].delete(' ').length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_with_c(students)
print_footer(students)
print_less_than_twelve(students)