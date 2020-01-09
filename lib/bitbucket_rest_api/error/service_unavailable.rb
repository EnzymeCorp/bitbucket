# frozen_string_literal: true
module BitBucket #:nodoc
  # Raised when BitBucket returns the HTTP status code 404
  module Error
    class ServiceUnavailable < BitBucketError
      def initialize(env)
        super(env)
      end
    end
  end # Error
end # BitBucket
