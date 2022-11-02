@students = [] # an empty array accessible to all methods
@name = ""  # an empty string accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(my_gets)
  end
end

def my_gets
  STDIN.gets.chomp
end

def process(selection)
  case selection
    when "1" ; input_students
    when "2" ; show_students
    when "3" ; save_students
    when "4" ; load_students
    when "9" ; exit # this will cause the program to terminate
    else puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  # get the first name
  @name = my_gets
  # while the name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    load_student(:november)
    puts "Now we have #{@students.count} students"
    # gets another name from the user
    @name = my_gets
  end
end

def load_student(cohort)
  @students << {name: @name, cohort: cohort.to_sym}
end 

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy\n-------------"
end

def print_students_list
  @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
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
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  @name, cohort = line.chomp.split(',')
    load_student(cohort)
  end
  file.close
end

def startup_load_students
  ARGV.first.nil? ? filename = "students.csv" : filename = ARGV.first
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

startup_load_students
interactive_menu
