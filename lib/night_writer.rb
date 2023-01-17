require_relative 'braille_dictionary'

class NightWriter
  include BrailleDictionary
  attr_reader :read_file,
              :write_file,
              :text,
              :enlglish_to_braille_hash

 def initialize(input, output)
   @read_file = input
   @write_file = output
   @text = File.open(@read_file, "r")
   @enlglish_to_braille_hash = DICTIONARY
 end
 
  def read_and_write_text
    text = @text.read

    substrings = get_substrings(text)
    converted_braille = braille_converter(substrings)

    puts "Created #{@write_file} containing #{text.chars.count} characters"
    File.write(@write_file, converted_braille)
  end

  def braille_converter(substrings) 
    braille_chars = substrings.map do |str|
      str.chars.map do |char|
        @enlglish_to_braille_hash[char]
      end
    end
    braille_chars.map do |array|
      array.transpose.map(&:join)
    end.join("\n")
  end

  def get_substrings(text)
    strings = [""]

    words = text.split
    words = break_up_long_words(words)
    words.each do |str|
      unless strings[-1].length + str.length > 40
        strings[-1] << "#{str} "
      else 
        strings << "#{str} "
      end
    end
    strings.map(&:rstrip)
  end

  def break_up_long_words(words)
    words.map do |word|
      unless word.length > 40
        word
      else 
        word.scan(/.{1,40}/)
      end
    end.flatten
  end
end

