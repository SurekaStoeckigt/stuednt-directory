def add_cohort

  cohort_arr = ["January", "February","March","April","May","June","July","August","September","Octorber","November","December"]
  puts "Enter cohort: "
  cohort = gets.chomp
  def_cohort = "November"
  while true do
    if !cohort_arr.include?(cohort.to_s) && !cohort.empty?
      puts "Typo, enter cohort: "
      cohort = gets.chomp
      break
    elsif cohort.empty?
      cohort = def_cohort
      break
  else
      cohort = cohort
    break 
    end
  end
  cohort
end

def input_students
    puts "Please enter the names, hobbies, and country of birth of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name 
    name = gets.chomp
    cohort = add_cohort
    #while the name is not empty, repeat this code
    def_name = "Student"

    if name.empty? 
        name = def_name
        cohort = add_cohort
        students << {name: name, cohort: cohort}
    else
    end 
    
    while !name.empty?  do
        #add the student to the array
            name = name
            cohort = cohort
            students << {name: name, cohort: cohort}
   
        puts "Now we have #{students.count} students"
        #add another name from the user
        name = gets.chomp
        cohort = add_cohort
            
    end
    #return the array of students 
     students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
index = 0

 while index < students.size  do
  puts "#{index} #{students[index][:name]}, #{students[index][:cohort]}".lines.map { |line| line.strip.center(50) }.join("\n")
  index +=1
 end
end 

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)