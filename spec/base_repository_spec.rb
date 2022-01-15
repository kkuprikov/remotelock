# frozen_string_literal: true

require_relative '../app/repositories/base_repository'
require_relative '../lib/loaders/base_loader'

RSpec.describe BaseRepository do
  let(:order) { :field }
  let(:rows) { [{ field: 'z' }, { field: 'a' }] }
  let(:loader) { double }

  subject { described_class.new(loader).order_by(order).map { |row| row[:field] } }

  it 'should sort data hashes by field' do
    allow(loader).to receive(:read) { rows }
    expect(subject).to eq(%w[a z])
  end
end
