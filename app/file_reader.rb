# frozen_string_literal: true

class FileReader
  def initialize(file)
    @file = file
    @file_format_error = 'Check logs file format. File with page visits logs should looks like "#path #IP"'
  end

  def to_hash
    file_as_hash = {}
    File.readlines(@file).each do |line|
      split_line = line.split
      validate_line split_line
      ip = split_line[1]
      path = split_line[0]
      hash_value = file_as_hash[path] ? file_as_hash[path] << ip : [ip]
      file_as_hash[path] = hash_value
    end
    file_as_hash
  end

  private

  def validate_line(split_line)
    raise @file_format_error if split_line.size < 2
  end
end
