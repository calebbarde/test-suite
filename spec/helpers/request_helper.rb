require 'rest-client'
require 'builder'
require 'active_support/core_ext/hash'

module Helpers
  module RequestHelper
    attr_accessor :_host
    attr_accessor :_private_key
    attr_accessor :response

    def host(host)
      @_host = host
    end

    def private_key(private_key)
      @_private_key = private_key
    end

    def post(url, params:, headers: {}, options: {})
      @response = RestClient::Request.execute(
        method: :post,
        url: build_url(url),
        payload: convert_to_xml(params),
        headers: headers
      )
    rescue RestClient::ExceptionWithResponse => e
      @response = e.response
    end

    def build_url(url)
      "https://#{_private_key}:@#{_host}#{url}"
    end

    def convert_to_xml(params)
      params[params.keys.first].to_xml(
        root: params.keys.first,
        dasherize: false
      )
    end
  end
end
