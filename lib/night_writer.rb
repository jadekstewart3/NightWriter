class NightWriter
  attr_reader  :english_to_braille
  attr_accessor :read_file,
                :write_file,
                :text

 def initialize
   @read_file = ARGV[0]
   @write_file = ARGV[1]
   @text = File.open(@read_file, "r")
   @english_to_braille = {
         "a" => ["0.", "..", ".."],
         "b" => ["0.", "0.", ".."],
         "c" => ["00", "..", ".."],
         "d" => ["00", ".0", ".."],
         "e" => ["0.", ".0", ".."],
         "f" => ["00", "0.", ".."],
         "g" => ["00", "00", ".."],
         "h" => ["0.", "00", ".."],
         "i" => [".0", "0.", ".."],
         "j" => [".0", "00", ".."],
         "k" => ["0.", "..", "0."],
         "l" => ["0.", "0.", "0."],
         "m" => ["00", "..", "0."],
         "n" => ["00", ".0", "0."],
         "o" => ["0.", ".0", "0."],
         "p" => ["00", "0.", "0."],
         "q" => ["00", "00", "0."],
         "r" => ["0.", "00", "0."],
         "s" => [".0", "0.", "0."],
         "t" => [".0", "00", "0."],
         "u" => ["0.", "..", "00"],
         "v" => ["0.", "0.", "00"],
         "w" => [".0", "00", ".0"],
         "x" => ["00", "..", "00"],
         "y" => ["00", ".0", "00"],
         "z" => ["0.", ".0", "00"],
         " " => ["..", "..", ".."]
         }
 end
 
  def read_and_write_text
    text = @text.read

    substrings = get_substrings(text)
    converted_braille = braille_converter(substrings)

    puts "Created #{@write_file} containing #{text.split("").count} characters"
    File.write(@write_file, converted_braille)
  end

  def braille_converter(substrings) 
    braille_chars = substrings.map do |str|
      str.chars.map do |char|
        @english_to_braille[char]
      end
    end
    braille_chars.map do |array|
      compact_array = array.compact
      compact_array.transpose.map(&:join)
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
# night_writer = NightWriter.new
# night_writer.read_file = "./message.txt" if night_writer.read_file.nil?
# night_writer.write_file = "./braille.txt" if night_writer.write_file.nil?
# night_writer.read_and_write_text
#use this^^ to run from command line (runner file style)
