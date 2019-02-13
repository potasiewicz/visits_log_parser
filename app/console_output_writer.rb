# frozen_string_literal: true

class ConsoleOutputWriter
  def initialize(data, postfix = 'visits')
    data.each { |k, v| puts "#{k} #{v} #{postfix}" }
  end
end
