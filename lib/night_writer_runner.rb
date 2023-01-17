require_relative 'night_writer'

input = ARGV[0]
output = ARGV[1]
night_writer = NightWriter.new(input, output)
night_writer.read_and_write_text