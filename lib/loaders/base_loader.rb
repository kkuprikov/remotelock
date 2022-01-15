# frozen_string_literal: true

class BaseLoader
  FORMAT_TO_DELIMETER = {
    dollar_format: ' $ ',
    percent_format: ' % '
  }.freeze

  def initialize(format_to_data)
    @format_to_data = format_to_data.slice(*FORMAT_TO_DELIMETER.keys)
  end

  def read
    @format_to_data.each_with_object([]) do |(format_name, data), out|
      out << format_with_delimeter(data, FORMAT_TO_DELIMETER[format_name])
    end.flatten
  end

  private

  def format_with_delimeter(data, delimeter)
    rows = data.split("\n").map { |row| row.split(delimeter) }
    header = rows[0].map(&:to_sym)
    rows[1..-1].map { |row| header.zip(row).to_h }
  end
end
