# frozen_string_literal: true

class WebStatistics
  def initialize(data)
    @data = data
  end

  def most_visited_pages
    sort_desc_via_entries(@data.transform_values(&:size))
  end

  def most_unique_visited_pages
    sort_desc_via_entries(@data.transform_values { |v| v.uniq.size })
  end

  private

  def sort_desc_via_entries(data)
    data.sort_by { |_k, v| v }.reverse.to_h
  end
end
