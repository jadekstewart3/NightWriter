require_relative 'night_reader.rb'

input = ARGV[0]
output = ARGV[1]
night_reader = NightReader.new(input, output)
night_reader.read_and_write_braille