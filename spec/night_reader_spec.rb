require_relative 'spec_helper'

RSpec.describe NightReader do 

  let(:night_reader) { NightReader.new('./braille.txt', './original_message.txt') }

 describe '#initialize' do 
    it 'exists' do 
      expect(night_reader).to be_a(NightReader)
    end

    it 'has attributes' do 
      night_reader.read_and_write_braille
      expect(night_reader.read_file).to eq('./braille.txt')
      expect(night_reader.write_file).to eq('./original_message.txt')
    end
  end

  describe '#translate_braille_char' do
    it 'returns a single english character' do
      braille_text = ["0.","..", ".."]
      expect(night_reader.translate_braille_char(braille_text)).to eq("a")
    end
  end

  describe '#translate_braille_line' do 
    it 'returns multiple english characters' do
      braille_text = ["0.0...0000", "..0......0", ".........."]
      
      expect(night_reader.translate_braille_line(braille_text)).to eq("ab cd")
    end
  end

  describe '#break_up_braille_lines' do 
    it 'returns array containing arrays of strings' do
      file_contents = File.open('braille_fixture.txt', 'r').read
      expect(night_reader.break_up_braille_lines(file_contents)).to eq([["0.0.00", "..0...", "......"], ["000.00", ".0.00.", "......"]])
    end
  end
end