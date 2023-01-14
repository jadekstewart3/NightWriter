class NightWriter
   attr_accessor :read_file,
                 :write_file
 
 def initialize
   @read_file = ARGV[0]
   @write_file = ARGV[1]
 end
 
 def read_and_write
   message = File.open(@read_file, "r")
 
   text = message.read
    puts "Created #{@write_file} containing #{text.split('').count} characters"
   File.write(@write_file, text)
 end
end
# night_writer = NightWriter.new
# night_writer.read_file = './message.txt' if night_writer.read_file.nil?
# night_writer.write_file = './braille.txt' if night_writer.write_file.nil?
# night_writer.read_and_write
#use this^^ to run from command line (runner file style)
