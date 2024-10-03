require 'rspec'
require_relative '../lib/easy_broker_api'

describe EasyBrokerAPI do
  let(:api) { EasyBrokerAPI.new }

  it 'should retrieve property titles' do
    titles = api.get_property_titles
    expect(titles).to be_an(Array)
    expect(titles).not_to be_empty
  end
