require_relative 'spec_helper'

RSpec.describe NightWriter do
 
 let(:night_writer) { NightWriter.new('./message.txt', './braille.txt') }
 
 describe '#initalize' do
   it 'exists' do
     expect(night_writer).to be_a(NightWriter)
   end
 
   it 'has attributes' do
     night_writer.read_and_write_text

     expect(night_writer.read_file).to eq('./message.txt')
     expect(night_writer.write_file).to eq('./braille.txt')
     expect(night_writer.text).to be_a(File)
     expect(night_writer.enlglish_to_braille_hash).to be_a(Hash)
   end
  end
 
 describe '#get_substrings' do 
  it 'returns an array of substrings' do
    file_contents = File.open('fixture/message_41_char_fixture.txt', 'r').read
    
    expect(night_writer.get_substrings(file_contents)).to eq(["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a"])
  end
end

describe '#braille_converter' do 
  it 'can convert a single english letter to braille' do
    expect(night_writer.braille_converter(["a"])).to eq("0.\n..\n..")
  end

  it 'can convert a multiple english letters to braille' do
    
    expect(night_writer.braille_converter(["ab cde"])).to eq("0.0...00000.\n..0......0.0\n............")
  end
end

describe '#break_up_long_words' do 
  it 'breaks english characters over 40 caharacters long' do
    text_array = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"]
    
    expect(night_writer.break_up_long_words(text_array)).to eq(["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a"])
    end
  end

  describe '#read_and_write_text' do 
    it 'returns translated english to braille text' do
      night_writer.read_and_write_text
      expect(File.open('braille.txt', 'r').read).to match(File.open('fixture/braille_fixture.txt', 'r').read)
    end
  end
end