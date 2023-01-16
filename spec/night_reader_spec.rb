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

  describe '#english_converter' do
      it 'returns an array of substrings' do
        braille_text = "0. .. .."
    
        expect(night_reader.get_substrings(braille_text)).to eq(["0.", "..", ".."])
      end

      xit 'breaks up braille characters over 40 caharacters long' do
        braille_array = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
................................................................................
................................................................................
0.
..
.."]
  
        expect(night_reader.break_up_long_words(braille_array)).to eq(["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"])
      end


      xit 'can convert a single english letter to braille' do
        expect(night_reader.english_converter).to eq("a")
      end
   end
end