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
      braille_text = "0.\n..\n.."
      expect(night_reader.translate_braille_char(braille_text)).to eq("a")
    end
  end
end