def my_puts(str)
  # Center output text
  puts str.center(60)
end

def default_value(str)
  # Create default value when user value is empty
  str.empty? ? "BLANK" : str
end

def question(str)
  puts "Enter #{str}"
end

def input_students
  puts "Please enter the details of the students"
  puts "-------------"
  
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while true do
    question("name (To finish, enter 'q' and hit return)")
    name = gets.chomp
      break if name == "q"
    question("cohort")
    cohort = gets.chomp
    question("hobby")
    hobby = gets.chomp
    question("country of birth")
    country = gets.chomp

    puts "Please review your selections...." 
    my_puts("Name: #{name}")
    my_puts("Cohort: #{cohort}")
    my_puts("Hobby: #{hobby}")
    my_puts("Country of birth #{country}")
    puts "Are these correct? Y/N"

    if gets.chomp == "Y"
      # add the student hash to the array
      students << {
        name: default_value(name), 
        cohort: default_value(cohort).to_sym, 
        hobby: default_value(hobby), 
        country: default_value(country)
      }
      puts "Now we have #{students.count} students, please enter details for the next student"
    else
      puts "Please re-enter the correct details"
    end
 
  end
  # return the array of students
  students
end

def print_header
  my_puts("The students of Villains Academy")
  my_puts("-------------")
end

def print_by_cohort(students)
  # print students by cohort
  groups = students.map {|group| group[:cohort]}.uniq
  
  groups.each do |group|
    puts group
    students.each {|student| puts student[:name] if student[:cohort] == group} 
  end

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
#print(students)
# print_while(students)
# print_with_c(students)
# print_less_than_twelve(students)
print_by_cohort(students)
print_footer(students)