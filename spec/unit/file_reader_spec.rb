# frozen_string_literal: true

describe FileReader do
  describe '#to_hash' do
    context 'file has correct format' do
      before(:each) do
        @file_path = './spec/example_data/test_webserver.log'
      end
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
    context 'file has incorrect format' do
      before(:each) do
        @file_path = './spec/example_data/test_webserver_invalid.log'
      end
      it 'return RuntimeException' do
        expect { FileReader.new(@file_path).to_hash }.to raise_error RuntimeError
      end
    end
  end
end
