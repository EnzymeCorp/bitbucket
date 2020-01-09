# frozen_string_literal: true
module BitBucket
  # Allows you to specify parameters keys which will be preserved
  # in parameters hash and its subhashes. Any keys from the nested
  # hash that do not match will be removed.
  module ParameterFilter
    # Removes any keys from nested hashes that don't match predefiend keys
    #
    def filter!(keys, params, options = { recursive: true }) # :nodoc:
      case params
      when Hash
        params.keys.each do |k, _v|
          if keys.include?(k) || BitBucket::Validations::VALID_API_KEYS.include?(k)
            filter!(keys, params[k]) if options[:recursive]
          else
            params.delete(k)
          end
        end
      when Array
        params.map! do |el|
          filter!(keys, el) if options[:recursive]
        end
      else
        params
      end
      params
    end
  end # Filter
end # BitBucket
