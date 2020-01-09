# frozen_string_literal: true
require 'faraday'

module BitBucket
  class Response::Jsonize < Response
    dependency 'multi_json'

    define_parser do |body|
      MultiJson.load(body)
    end

    def parse(body)
      case body
      when ''
        nil
      when 'true'
        true
      when 'false'
        false
      else
        self.class.parser.call body
      end
    end
  end # Response::Jsonize
end # BitBucket
