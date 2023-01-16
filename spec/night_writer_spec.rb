require_relative 'spec_helper'

RSpec.describe NightWriter do
 
 let(:night_writer) { NightWriter.new }

 before do
   night_writer.read_file = './message.txt'
   night_writer.write_file = './braille.txt'
 end
 
 describe '#initalize' do
   it 'exists' do
     expect(night_writer).to be_a(NightWriter)
   end
 
   it 'has attributes' do
     night_writer.read_and_write_text
     expect(night_writer.read_file).to eq('./message.txt')
     expect(night_writer.write_file).to eq('./braille.txt')
   end
 end
 
  describe '#braille_converter' do 
    it 'can convert a single english letter to braille' do
      expect(night_writer.braille_converter(["a"])).to eq("0.\n..\n..")
    end

    it 'can convert a multiple english letters to braille' do
      expect(night_writer.braille_converter(["ab ,cde"])).to eq("0.0...00000.\n..0......0.0\n............")
    end
  end

  describe '#get_substrings' do 
    it 'returns an array of substrings' do
      text = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

      expect(night_writer.get_substrings(text)).to eq(["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a"])
    end
  end

  describe '#break_up_long_words' do 
    it 'breaks english characters over 40 caharacters long' do
      text_array = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"]
  
      expect(night_writer.break_up_long_words(text_array)).to eq(["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a"])
    end
  end
end