require_relative 'braille_dictionary'

class NightReader
  include BrailleDictionary
  attr_accessor :read_file,
                :write_file,
                :braille_text

  def initialize(input, output)
    @read_file = input
    @write_file = output
    @braille_text = File.open(@read_file, "r")
  end

  def read_and_write_braille
   braille_message = File.open(@read_file, "r")
   
    braille_text = braille_message.read
    substrings = get_substrings(braille_text)

    puts "Created #{@write_file} containing #{braille_text.split('').count} characters"
    File.write(@write_file, braille_text)
 end

 def get_substrings(braille_text)
    braille_strings = [""]
    braille_substrings = braille_text.split
    braille_substrings.each do |b_str|
      unless braille_strings[-1].length + b_str.length > 40 
        braille_strings[-1] << "#{b_str}"
      else
        braille_strings << "#{b_str}"
      end
    end
  end

  

  #make each line an array
  #split by first two elements in array group by 3(rows)
  #rev transpose?


end
# input = ARGV[0]
# output = AGRV[1]
# night_reader = NightReader.new(input, output)
# night_reader.read_file = "./braille.txt" if night_reader.read_file.nil?
# night_reader.write_file = "./original_message.txt" if night_reader.write_file.nil?
# night_reader.read_and_write_braille
##use this to run from command line ^^