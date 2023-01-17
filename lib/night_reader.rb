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

  def translate_braille_char(strings)
    INVERTED_DICTIONARY[strings]
  end

  def translate_braille_line(strings)
    string_arrays = strings.map do |str|
      str.chars.each_slice(2).map(&:join)
    end

    english_chars = string_arrays.transpose.map do |array|
      translate_braille_char(array)
    end.join
  end

  def break_up_braille_lines(text)
    strings = text.split("\n")
    strings.each_slice(3).to_a
  end


end
# input = ARGV[0]
# output = ARGV[1]
# night_reader = NightReader.new(input, output)
# night_reader.read_and_write_braille
##use this to run from command line ^^