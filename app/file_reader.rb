# frozen_string_literal: true

class FileReader
  def initialize(file)
    @file = file
  end

  def to_hash
    file_as_hash = {}
    File.readlines(@file).each do |line|
      split_line = line.split
      ip = split_line[1]
      path = split_line[0]
      hash_value = file_as_hash[path] ? file_as_hash[path] << ip : [ip]
      file_as_hash[path] = hash_value
    end
    file_as_hash
  end
end
