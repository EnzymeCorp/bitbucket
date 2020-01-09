# frozen_string_literal: true
require 'faraday'

module BitBucket
  class Request::Jsonize < Faraday::Middleware
    CONTENT_TYPE = 'Content-Type'
    MIME_TYPE    = 'application/json'

    dependency 'multi_json'

    def call(env)
      if request_with_body?(env)
        env[:request_headers][CONTENT_TYPE] ||= MIME_TYPE
        env[:body] = encode_body env unless env[:body].respond_to?(:to_str)
      end
      @app.call env
    end

    def encode_body(env)
      MultiJson.dump(env[:body])
    end

    def request_with_body?(env)
      type = request_type(env)
      has_body?(env) && (type.empty? || (type == MIME_TYPE))
    end

    # Don't encode bodies in string form
    def has_body?(env)
      (body = env[:body]) && !(body.respond_to?(:to_str) && body.empty?)
    end

    def request_type(env)
      type = env[:request_headers][CONTENT_TYPE].to_s
      type = type.split(';', 2).first if type.index(';')
      type
    end
  end # Request::Jsonize
end # BitBucket
