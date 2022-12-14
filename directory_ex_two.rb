require 'csv'
@students = [] # an empty array accessible to all methods
@name = ""  # an empty string accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "5. Print source code"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(my_gets)
  end
end

def process(selection)
  case selection
    when "1" ; input_students
    when "2" ; show_students
    when "3" ; input_file_name("save")
    when "4" ; input_file_name("load")
    when "5" ; print_source_code
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
  feedback_message("Input")
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

def input_file_name(action)
  puts "Enter file name (e.g. students.csv)"
  filename = my_gets
    if File.exist?(filename)
      action == "save" ? save_students(filename) : load_students(filename)
    else
      no_file_message(filename)
    end
end

def save_students(filename)
  CSV.open(filename, "wb") do |csv|
    # iterate over the array of students
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  feedback_message("Save")
end

def load_students(filename)
  CSV.foreach(filename) do |row|
    @name, cohort = row[0], row[1]
      load_student(cohort)
  end
  feedback_message("Load")
end

def print_source_code
  puts File.read(__FILE__)
  feedback_message("Print source code")
end

def startup_load_students
  ARGV.first.nil? ? filename = "students.csv" : filename = ARGV.first
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    no_file_message(filename)
    exit # quit the program
  end
end

def my_gets
  STDIN.gets.chomp
end

def load_student(cohort)
  @students << {name: @name, cohort: cohort.to_sym}
end 

def feedback_message(action)
  puts "-------------\n#{action} has been completed sucessfully\n-------------"
end

def no_file_message(filename)
  puts "Sorry, #{filename} doesn't exist"
end

startup_load_students
interactive_menu