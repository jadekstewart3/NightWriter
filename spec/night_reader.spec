require_relative 'spec_helper'

RSpec.describe NightReader do 

  let(:night_reader) {NightReader.new}

  before do
   night_reader.write_file = './original_message.txt'
   night_reader.read_file = './braille.txt'
 end

 describe '#initialize' do 
  it 'exists' do 
    expect(night_reader).to be_a(NightReader)
  end

  it 'has attributes' do 
    night_reader.read_and_write_text

    expect(night_reader.write_file).to eq('./original_message.txt')
    expect(night_reader.read_file).to eq('./braille.txt')
  end
 end
end