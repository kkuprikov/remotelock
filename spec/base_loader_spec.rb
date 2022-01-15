# frozen_string_literal: true

require_relative '../lib/loaders/base_loader'

RSpec.describe BaseLoader do
  let(:data) { { dollar_format: File.read('spec/fixtures/people_by_dollar.txt') } }
  let(:parsed_data) do
    [{ birthdate: '30-4-1974', city: 'LA', first_name: 'Rhiannon', last_name: 'Nolan' },
     { birthdate: '5-1-1962', city: 'NYC', first_name: 'Rigoberto', last_name: 'Bruen' }]
  end

  subject { described_class.new(data).read }

  it 'should prepare data hashes according to delimeter' do
    expect(subject).to eq(parsed_data)
  end
end
