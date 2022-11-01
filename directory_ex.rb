def my_puts(str)
  puts str.center(60)
end

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
    puts "Enter cohort"
    cohort = gets.chomp.to_s
    puts "Enter hobby"
    hobby = gets.chomp
    puts "Enter country of birth"
    country = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, country: country}
    puts "Now we have #{students.count} students" 
    puts "Enter next name"
  end
  # return the array of students
  students
end

def print_header
  my_puts("The students of Villains Academy")
  my_puts("-------------")
end

def print(students)
  # print a number before the name and cohort of each student
  my_puts("See full cohort below with number")
  students.each_with_index do |student, index|
    my_puts("#{index + 1}. #{student[:name]} - (Cohort: #{student[:cohort]}, Hobby: #{student[:hobby]}, Country of birth: #{student[:country]})")
  end
end

def print_while(students)
  # print a number before the name and cohort of each student using while
  index = 0
  my_puts("See full cohort below using while")
  while index < students.count do 
    my_puts("#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]})")
    index += 1
  end
end


def print_with_c(students)
  # print only if name begins with C
  my_puts("See cohort with names beginning with C")
  students.each_with_index do |student|
    if student[:name][0] == "C"
      my_puts("#{student[:name]} (#{student[:cohort]} cohort)")
    end
  end
end

def print_less_than_twelve(students)
  # print only if name is less than 12 chars
  my_puts("See cohort with names less than 12 characters")
  students.each_with_index do |student|
    if student[:name].delete(' ').length < 12
      my_puts("#{student[:name]} (#{student[:cohort]} cohort)")
    end
  end
end

def print_footer(students)
  my_puts("Overall, we have #{students.count} great students")
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
# print_while(students)
# print_with_c(students)
# print_less_than_twelve(students)
print_footer(students)