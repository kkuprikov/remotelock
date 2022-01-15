# frozen_string_literal: true

require 'date'

module PeoplePresenter
  DATE_FORMAT = ENV.fetch('DATE_FORMAT', '%-m/%-d/%Y')
  OUTPUT_DELIMETER = ENV.fetch('OUTPUT_DELIMETER', ', ')

  CITIES_DICT = {
    'LA' => 'Los Angeles',
    'NYC' => 'New York City'
  }.freeze

  OUTPUT_FORMAT = {
    first_name: nil,
    city: proc do |city|
      CITIES_DICT[city] || city
    end,
    birthdate: proc do |date|
      Date.parse(date).strftime(DATE_FORMAT)
    end
  }.freeze

  def self.present(row, delimeter: OUTPUT_DELIMETER)
    OUTPUT_FORMAT.each_with_object({}) do |(field, transform), acc|
      acc[field] = transform&.call(row[field]) || row[field]
    end.values.join(delimeter)
  end
end
