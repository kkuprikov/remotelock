# frozen_string_literal: true

require_relative '../repositories/base_repository'
require_relative '../presenters/people_presenter'

class PeopleFormatterService
  def initialize(repository:, order:)
    @repository = repository
    @order = order
  end

  def call
    @repository
      .order_by(@order)
      .map { |row| PeoplePresenter.present(row) }
  end

  private

  def formats
    @formats ||= ENV.fetch('DELIMETER_NAMES', @loader::FORMAT_TO_DELIMETER.keys)
  end
end
