# frozen_string_literal: true

describe VisitsLogApp do
  describe '#initialize' do
    context 'data file is not set' do
      it 'return ArgumentError' do
        expect { VisitsLogApp.new }.to raise_error ArgumentError
      end
    end
  end

  describe '#parse' do
    subject { VisitsLogApp.new('./spec/example_data/test_webserver.log').parse }
    it 'return sorted visits and unique visits' do
      expected_output = 'List of webpages with most page views ordered from most pages views to less page views:' \
'/help_page/1 4 visits' \
'/contact 2 visits' \
'/home 1 visits' \
'List of webpages with most unique page views also ordered:' \
'/contact 2 unique views' \
'/help_page/1 2 unique views' \
'/home 1 unique views' \
''

      expect { subject }.to output(expected_output).to_stdout
    end
  end
end
