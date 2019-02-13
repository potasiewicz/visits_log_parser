# frozen_string_literal: true

describe WebStatistics do
  before(:each) do
    @data = {}
    @data = {
      "/path/b": ['126.318.035.038', '126.318.035.039'],
      "/path/a": ['126.318.035.038', '126.318.035.038', '126.318.035.039'],
      '/path/c': ['192.168.80.15']
    }.transform_keys!(&:to_s)
  end
  describe '#most_visited_pages' do
    it 'return hash with path as key and count of entries as value' do
      processed_data = WebStatistics.new(@data).most_visited_pages

      expect(processed_data.size).to eq 3
      expect(processed_data.keys.first).to eq '/path/a'
      expect(processed_data.values.first).to eq 3
    end

    it 'return hash ordered from most viewed pages' do
      processed_data = WebStatistics.new(@data).most_visited_pages

      expect(processed_data.values).to eq [3, 2, 1]
    end
  end

  describe '#most_unique_visited_pages' do
    it 'return hash with path as key and count of entries as value' do
      processed_data = WebStatistics.new(@data).most_unique_visited_pages

      expect(processed_data.size).to eq 3
      expect(processed_data.keys.first).to eq '/path/a'
      expect(processed_data.values.first).to eq 2
    end

    it 'return hash ordered from most viewed pages' do
      processed_data = WebStatistics.new(@data).most_unique_visited_pages

      expect(processed_data.values).to eq [2, 2, 1]
    end
  end
end
