# frozen_string_literal: true
# TODO: Set token required calls

module BitBucket
  module Validations
    module Token
      TOKEN_REQUIRED = [
        'get /user',
        'get /user/emails',
        'get /user/followers',
        'get /user/following',
        'get /user/keys',
        'get /user/repos',
        'patch /user',
        'post /user/emails',
        'post /user/keys',
        'post /user/repos'
      ].freeze

      TOKEN_REQUIRED_REGEXP = [
        %r{repos/.*/.*/comments}
      ].freeze

      # Ensures that required authentication token is present before
      # request is sent.
      #
      def validates_token_for(method, path)
        return true unless TOKEN_REQUIRED.grep("#{method} #{path}").empty?

        token_required = false
        TOKEN_REQUIRED_REGEXP.each do |regex|
          token_required = true if "#{method} #{path}" =~ regex
        end
        token_required
      end
    end # Token
  end # Validations
end # BitBucket
