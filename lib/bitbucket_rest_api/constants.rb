# frozen_string_literal: true
module BitBucket
  module Constants
    module_function

    # Response headers
    RATELIMIT_REMAINING = 'X-RateLimit-Remaining'

    RATELIMIT_LIMIT = 'X-RateLimit-Limit'

    CONTENT_TYPE = 'Content-Type'

    CONTENT_LENGTH = 'content-length'

    CACHE_CONTROL = 'cache-control'

    ETAG = 'ETag'

    SERVER = 'Server'

    DATE = 'Date'

    LOCATION = 'Location'

    USER_AGENT = 'User-Agent'

    ACCEPT = 'Accept'

    ACCEPT_CHARSET = 'Accept-Charset'

    # Link headers
    HEADER_LINK = 'Link'

    HEADER_NEXT = 'X-Next'

    HEADER_LAST = 'X-Last'

    META_REL = 'rel'

    META_LAST = 'last'

    META_NEXT = 'next'

    META_FIRST = 'first'

    META_PREV = 'prev'

    PARAM_PAGE = 'page'

    PARAM_PER_PAGE = 'per_page'

    PARAM_START_PAGE = 'start_page'

    # URI parsing
    QUERY_STR_SEP = '?'
  end # Constants
end # BitBucket
