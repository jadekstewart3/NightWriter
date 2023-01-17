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
    braille_text = @braille_text.read

    puts "Created #{@write_file} containing #{braille_text.split('').count} characters"
    File.write(@write_file, braille_text)
  end

  def translate_braille_char(braille)
    sliced_braille = braille.split("\n")
    INVERTED_DICTIONARY[sliced_braille]
  end

end
# input = ARGV[0]
# output = ARGV[1]
# night_reader = NightReader.new(input, output)
# night_reader.read_and_write_braille
##use this to run from command line ^^