require 'oauth'
require 'flexirest'

module Oneroster
  class ApiBase < Flexirest::Base
    cattr_accessor :consumer_key, :consumer_secret

    def self.api_auth_credentials(key, secret)
      self.consumer_key = key
      self.consumer_secret = secret
    end

    base_url 'https://oneroster.infinitecampus.org/campus/oneroster/entropyMaster/ims/oneroster/v1p1/'
    def self.inherited(klass)
      super(klass)
      klass.verbose!
      klass.request_body_type :json
    end
    before_request :set_authorization

    def set_authorization(name, request)
      consumer = OAuth::Consumer.new( self.class.consumer_key, self.class.consumer_secret, {
        :site => self.class.base_url,
        :signature_method => "HMAC-SHA1",
        :scheme => 'header'
      })

      timestamp = Time.now.to_i
      nonce = SecureRandom.uuid
      options = {
              :timestamp => timestamp,
              :nonce => nonce
      }
      url = Addressable::URI.parse(request.url)
      url.query_values = (url.query_values || {}).merge request.get_params
      url = url.to_s

      req = consumer.create_signed_request(request.method[:method], url, nil, options)
      
      request.headers['Authorization'] = req['Authorization']
      request.headers['Content-Type'] = nil
    end
  end
end
