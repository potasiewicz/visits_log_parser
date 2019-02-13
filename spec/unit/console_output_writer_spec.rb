# frozen_string_literal: true

describe ConsoleOutputWriter do
  before(:each) do
    @data = {
      'path/a': 4,
      'path/b': 2
    }
  end
  context 'postfix is not set' do
    subject { ConsoleOutputWriter.new(@data) }
    it 'return "{path} {count_of_view} visits" text' do
      expected_output = "path/a 4 visits\npath/b 2 visits\n"

      expect { subject }.to output(expected_output).to_stdout
    end
  end
  context 'postfix is set' do
    subject { ConsoleOutputWriter.new(@data, 'unique views') }
    it 'return "{path} {count_of_view} {postfix}" text' do
      expected_output = "path/a 4 unique views\npath/b 2 unique views\n"

      expect { subject }.to output(expected_output).to_stdout
    end
  end
end
