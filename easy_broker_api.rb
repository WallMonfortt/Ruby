require 'httparty'
require 'yaml'

class EasyBrokerAPI
  include HTTParty
  base_uri 'https://api.easybroker.com/v1'

  def initialize
    config = YAML.load_file('config/config.yml')
    @headers = {
      'Authorization' => "Bearer #{config['easy_broker_api_token']}",
      'Content-Type' => 'application/json'
    }
  end

  def get_property_titles
    response = self.class.get('/properties', headers: @headers)
    response.parsed_response.map { |property| property['title'] }
  end
end
