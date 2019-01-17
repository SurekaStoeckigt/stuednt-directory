def input_students
    puts "Please enter the names, hobbies, and country of birth of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name 
    name = gets.strip
    cohort = gets.strip
    #while the name is not empty, repeat this code
    while true  do
        #add the student to the array
        if !name.empty?  && cohort.empty?
          students << {name: name, cohort: "November"}
        elsif name.empty? && !cohort.empty?
          students << {name: "Student", cohort: cohort1}
        elsif !name.empty? && !cohort.empty?
          students << {name: name, cohort: cohort}
        elsif name.empty? && cohort.empty?
            break
        end
        puts "Now we have #{students.count} students"
        #add another name from the user
        name = gets.strip
        cohort = gets.strip
    end
    #return the array of students 
students

end 

def cohorts(students)
sorted_by_cohort = {}
students.each do |student|
  cohort = student[:cohort]
  name = student[:name]
  if sorted_by_cohort[cohort] = ""
    sorted_by_cohort[cohort] = [name]
  else
    sorted_by_cohort[cohort].push(name)  
  end
end
puts sorted_by_cohort
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
index = 0
  if students.empty? 
    puts ""
  else 
      while index < students.length do
        puts "#{index} #{students[index][:name]}, #{students[index][:cohort]}".lines.map { |line| line.strip.center(50) }.join("\n")
        index +=1
      end
  end
end 

def print_footer(students)
  if students.count < 2
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)