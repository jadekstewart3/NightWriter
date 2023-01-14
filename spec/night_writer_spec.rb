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
     night_writer.read_and_write
      expect(night_writer.read_file).to eq('./message.txt')
     expect(night_writer.write_file).to eq('./braille.txt')
   end
 end
end