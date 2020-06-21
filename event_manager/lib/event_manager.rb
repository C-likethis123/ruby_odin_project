puts "EventManager initialised!"

# Iteration 0
# We can read a file line by line, and use next if to skip the first iteration.
contents = File.readlines './event_attendees.csv'
contents.each_with_index do |line, index|
    next if index == 0
    column = line.split(",")
    name = column[2]
    puts name
end