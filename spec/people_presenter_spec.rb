# frozen_string_literal: true

require_relative '../app/presenters/people_presenter'

RSpec.describe PeoplePresenter do
  let(:data) { { first_name: 'Elliot', city: 'NYC', birthdate: '1947-05-04' } }

  it 'should produce a formatted string' do
    expect(described_class.present(data))
      .to eq('Elliot, New York City, 5/4/1947')
  end

  it 'should use a custom delimeter' do
    expect(described_class.present(data, delimeter: '; '))
      .to eq('Elliot; New York City; 5/4/1947')
  end
end
