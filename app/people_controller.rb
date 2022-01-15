# frozen_string_literal: true

require_relative './services/people_formatter_service'
require_relative '../lib/loaders/base_loader'
require_relative './repositories/base_repository'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    PeopleFormatterService.new(repository: repository, order: params[:order]).call
  end

  private

  def loader
    @loader ||= BaseLoader.new(params)
  end

  def repository
    @repository ||= BaseRepository.new(loader)
  end

  attr_reader :params
end
