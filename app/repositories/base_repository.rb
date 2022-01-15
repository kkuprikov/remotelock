# frozen_string_literal: true

class BaseRepository
  def initialize(loader)
    @rows = loader.read
  end

  def order_by(field)
    Enumerator.new(@rows.sort_by { |row| row[field] })
  end
end
