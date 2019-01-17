@students = [] # an empty array accessible to all methods

def print_menu
  # Print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #because we will add more items
end

def interactive_menu
  loop do 
  print_menu
  process(STDIN.gets.chomp)
  end
end

def process(selection)
  #selection = gets.chomp
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
        save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.chomp
  @cohort = STDIN.gets.chomp
  #while name is not empty, repeat this code
  while !@name.empty? do
    add_student(@name,@cohort)
    puts "Now we have #{@students.count} students"
    @name = STDIN.gets.chomp
    @cohort = STDIN.gets.chomp
  end
  @students
end  

def show_students
  print_header
  print_students
  print_footer
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students" 
end

public

def save_students(filename = "students.csv")
# open the file for writing
  file = File.open("students.csv", "w")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(",")
    add_student(@name, @cohort)
    return @students
  end
    
  file.close
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
# return @students
end

def try_load_students
  # first argument from the command line
  filename = ARGV.first 
  # get out of the method if filename is not given
  return if filename.nil?
    #check if given file exists -- ruby check file exists
  if File.exists?(filename)
    load_students(filenamme)
    puts "Loaded #{@students} from #{filename}"
  else # if file doesn't exist
    puts "Sorry #{filename} doesn't exist."
    exit # quit the program
  end
end




#nothing happens until we call the methods
try_load_students
interactive_menu

