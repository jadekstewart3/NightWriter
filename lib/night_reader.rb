require_relative 'braille_dictionary'

class NightReader
  include BrailleDictionary
  attr_reader :read_file,
              :write_file,
              :braille_text,
              :braille_to_english_hash

  def initialize(input, output)
    @read_file = input
    @write_file = output
    @braille_text = File.open(@read_file, "r")
    @braille_to_english_hash = INVERTED_DICTIONARY
  end

  def read_and_write_braille
    braille_text = @braille_text.read

    braille_lines = break_up_braille_lines(braille_text)
    english_string = translate_braille_line(braille_lines.flatten)
  
    puts "Created #{@write_file} containing #{english_string.chars.count} characters"
    File.write(@write_file, english_string)
  end

  def translate_braille_char(strings)
    @braille_to_english_hash[strings]
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
