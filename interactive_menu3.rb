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
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
  
  
#nothing happens until we call the methods
@students = interactive_menu
print_header
print(@students)
end