@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do 
  print_menu
  process(gets.chomp)
end


  
def print_menu
  # Print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #because we will add more items
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end 
  
def process(selection)
  selection = gets.chomp
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
        load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  loop do 
    @students = gets.chomp
  end
  @students
end  

def save_students
# open the file for writing
  file = File.open("students.csv", "w")
# iterate over the array of students so that 
  @students.each do |student|
  #every iteration writes a file like Dr. Hannibal Lecter,november = ["Der. Hannibal Lecter", :november]
  student_data = [student[:name], student[:cohort]]#
  #then join it all together in a string like "Dr.Hannibal Lecter,november"
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end

def load_students
  #open file for reading
  file = File.open("students.csv", "r")
  #read all lines into array and iterate over it
  file.readlines.each do |line|
      # discard the training new line character from line and split with comma
      # assign the line to name and cohort variables
      # parallel assignment: assigning two variables at the same time. 
      # If assigned value is an array, the first variable gets first value of array and the second variable gets second value
      name, cohort = line.chomp.split(",")
      # once we have name and cohort, create new hash and put list of students into it.
      # shovel operator
      # different from input_students method because we are converting a string that we read from a file to a symbol
      @students << {name: name, cohort: cohort.to_sym}
  end
  #close file
  file.close
end
#nothing happens until we call the methods
@students = interactive_menu
print_header
print(@students)
end