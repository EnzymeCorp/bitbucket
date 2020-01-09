# frozen_string_literal: true
module BitBucket #:nodoc
  # Raised when passed parameters are missing or contain wrong values.
  module Error
    class Validations < ClientError
      def initialize(_errors)
        super(
          generate_message(
            problem: '',
            summary: '',
            resolution: ''
          )
        )
      end
    end
  end # Error
end # BitBucket
