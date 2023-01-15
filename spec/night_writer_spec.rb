require_relative 'spec_helper'

RSpec.describe NightWriter do
 
 let(:night_writer) { NightWriter.new }

 before do
   night_writer.read_file = './message_fixture.txt'
   night_writer.write_file = './braille.txt'
 end
 
 describe '#initalize' do
   it 'exists' do
     expect(night_writer).to be_a(NightWriter)
   end
 
   it 'has attributes' do
     night_writer.read_and_write_text
      expect(night_writer.read_file).to eq('./message_fixture.txt')
     expect(night_writer.write_file).to eq('./braille.txt')
   end
 end
 
  describe '#braille_converter' do 

    
    it 'has a dictionary' do 
      expect(night_writer.english_to_braille).to be_a(Hash)
    end
    
    it 'can convert a single english letter to braille' do
      night_writer.read_file = './message_single_letter_fixture.txt'

      expect(night_writer.braille_converter).to eq("0.\n..\n..")
    end

    it 'can convert a multiple english letters to braille' do
      expect(night_writer.braille_converter).to eq("0.0...00000.\n..0......0.0\n............")
    end
  end
end