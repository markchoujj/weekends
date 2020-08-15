module V1
  module Helpers
    def headers
      request.headers
    end

    def response_format
      present :result, true
      present :status, 200
    end

    def present_save_error(record)
      error!(
        result: false,
        message: record.errors.full_messages.join(','),
        status: 422
      )
    end

    def request_format(req)
      req.headers['accept'] = '*/*'
      req.headers['Content-Type'] = "application/json"
    end
  end
end
