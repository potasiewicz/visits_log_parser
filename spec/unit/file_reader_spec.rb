# frozen_string_literal: true

describe FileReader do
  before(:each) do
    @file_path = './spec/example_data/test_webserver.log'
  end
  describe '#to_hash' do
    context 'file is in correct format' do
      it 'return file as hash object' do
        file_as_hash = FileReader.new(@file_path).to_hash

        expect(file_as_hash.size).to eq 3
      end
      it 'hash item has format path:IPs_array' do
        file_as_hash = FileReader.new(@file_path).to_hash

        expect(file_as_hash.keys.first).to eq '/help_page/1'
        expect(file_as_hash.values.first).to eq [
          '126.318.035.038',
          '126.318.035.038',
          '126.318.035.038',
          '126.318.035.039'
        ]
      end
    end
  end
end
