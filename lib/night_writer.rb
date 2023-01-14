message = File.open(ARGV[0], "r")

incoming_message_text = message.read

message.close

text = incoming_message_text

writer = File.open(ARGV[1], "w")

puts "Created #{ARGV[1]} containing #{text.split('').count} characters."

writer.write(text)

writer.close