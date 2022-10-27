def input_students
  puts "Please enter the details of the students"
  puts "-------------"
  # create an empty array
  students = []
  puts "Enter name"
  # while the name is not empty, repeat this code
  while true do
    puts "To finish, just leave blank and hit return"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "Enter hobby"
    hobby = gets.chomp
    puts "Enter country"
    country = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, country: country}
    puts "Now we have #{students.count} students"
    puts "Enter next name"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  # print a number before the name and cohort of each student
  puts "See full cohort below with number"
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} - (Cohort: #{student[:cohort]}, Hobby: #{student[:hobby]}, Country: #{student[:country]})"
  end
end

def print_while(students)
  # print a number before the name and cohort of each student using while
  index = 0
  puts "See full cohort below using while"
  while index < students.count do 
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]})"
    index += 1
  end
end


def print_with_c(students)
  # print only if name begins with C
  puts "See cohort with names beginning with C"
  students.each_with_index do |student|
    if student[:name][0] == "C"
      puts "#{student[:name]} (#{student[:cohort]} cohort)" 
    end
  end
end

def print_less_than_twelve(students)
  # print only if name is less than 12 chars
  puts "See cohort with names less than 12 characters"
  students.each_with_index do |student|
    if student[:name].delete(' ').length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
print_while(students)
print_with_c(students)
print_less_than_twelve(students)
print_footer(students)