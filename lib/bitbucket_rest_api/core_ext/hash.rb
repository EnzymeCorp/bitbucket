# frozen_string_literal: true
class Hash # :nodoc:
  unless method_defined?(:symbolize_keys)
    def symbolize_keys  # :nodoc:
      each_with_object({}) do |(key, value), hash|
        hash[(begin
                key.to_sym
              rescue StandardError
                key
              end) || key] = value
      end
    end
  end

  unless method_defined?(:symbolize_keys!)
    def symbolize_keys! # :nodoc:
      hash = symbolize_keys
      hash.each do |key, val|
        hash[key] = case val
                    when Hash
                      val.symbolize_keys!
                    when Array
                      val.map do |item|
                        item.is_a?(Hash) ? item.symbolize_keys! : item
                      end
                    else
                      val
                    end
      end
      hash
    end
  end

  unless method_defined?(:serialize)
    def serialize # :nodoc:
      map { |key, val| [key, val].join('=') }.join('&')
    end
  end

  unless method_defined?(:all_keys)
    def all_keys # :nodoc:
      keys = self.keys
      keys.each do |key|
        if self[key].is_a?(Hash)
          keys << self[key].all_keys.compact.flatten
          next
        end
      end
      keys.flatten
    end
  end

  unless method_defined?(:has_deep_key?)
    def has_deep_key?(key)
      all_keys.include? key
    end
  end
end # Hash
