def input_students
    puts "Please enter the names, hobbies, and country of birth of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name 
    name = gets.chomp
    hobby = gets.chomp
    country = gets.chomp
    height = gets.chomp
    #while the name is not empty, repeat this code
    while !name.empty? do 
        #add the student to the array
        students << {name: name, cohort: :november, hobby: hobby, country: country, height: height}
        puts "Now we have #{students.count} students"
        #add another name from the user
        name = gets.chomp
        if !name.empty? 
          hobby  = gets.chomp
          country = gets.chomp
          height = gets.chomp    
        else 
        end
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
  while index < students.length do
        puts "#{index} #{students[index][:name]}, #{students[index][:hobby]}, #{students[index][:country]}, #{students[index][:height]}".lines.map { |line| line.strip.center(50) }.join("\n")
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