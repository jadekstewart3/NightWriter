class NightReader
  attr_reader  :braille_to_english
  attr_accessor :read_file,
                :write_file

  def initalize 
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end

  def read_and_write_braille
   message = File.open(@read_file, "r")

    text = message.read
    puts "Created #{@write_file} containing #{text.split('').count} characters"
    File.write(@write_file, text)
 end
end
# night_reader = NightReader.new
# night_reader.read_file = "./braille.txt" if night_reader.read_file.nil?
# night_reader.write_file = "./original_message.txt" if night_reader.write_file.nil?
# night_reader.read_and_write_braille
##use this to run from command line ^^