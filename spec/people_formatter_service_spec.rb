# frozen_string_literal: true

require_relative '../app/services/people_formatter_service'

RSpec.describe PeopleFormatterService do
  let(:order) { :first_name }
  let(:repository) { double }
  let(:loader) { double }
  let(:presenter) { class_double(PeoplePresenter).as_stubbed_const(transfer_nested_constants: true) }
  let(:rows) { %w[test1 test2] }

  subject { described_class.new(repository: repository, order: order).call }

  specify do
    expect(repository).to receive(:order_by).with(order).and_return(rows)
    rows.each { |row| expect(presenter).to receive(:present).with(row).and_return('') }
    subject
  end
end
