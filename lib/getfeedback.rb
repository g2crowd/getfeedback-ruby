require 'net/https'
require 'uri'
require 'cgi'
require 'multi_json'
require 'set'
require 'thread'

require 'getfeedback/version'
require 'getfeedback/utils'
require 'getfeedback/json'

require 'getfeedback/enumerable_resource_collection'
require 'getfeedback/resource'
require 'getfeedback/operations/all'
require 'getfeedback/operations/retrieve'
require 'getfeedback/resources/survey_response'
require 'getfeedback/resources/survey'

require 'getfeedback/errors'
require 'getfeedback/http_response'
require 'getfeedback/http_adapter'
require 'getfeedback/client'

module Getfeedback
  @mutex = Mutex.new

  class << self
    attr_accessor :api_key, :api_base_url, :http_adapter
    attr_writer :shared_client

    def shared_client
      @mutex.synchronize do
        @shared_client ||= Client.new(api_key: api_key, api_base_url: api_base_url, http_adapter: http_adapter)
      end
    end
  end
end
