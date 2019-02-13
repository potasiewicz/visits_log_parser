# frozen_string_literal: true

class FileReader
  def initialize(file)
    @file = file
  end

  def to_hash
    file_as_hash = {}
    File.readlines(@file).each do |line|
      split_line = line.split
      if file_as_hash[split_line[0]]
        hash_value = file_as_hash[split_line[0]] << split_line[1]
      else
        hash_value = [split_line[1]]
      end
      file_as_hash[split_line[0]] = hash_value
    end
    file_as_hash
  end
end
