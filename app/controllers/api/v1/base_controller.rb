class Api::V1::BaseController < ActionController::API
  include CustomErrors

  rescue_from ActionController::ParameterMissing do
    api_error(status: 400, errors: 'Invalid parameters')
  end

  rescue_from ActiveRecord::RecordNotFound do
    api_error(status: 404, errors: 'Resource not found!')
  end

  protected

    def invalid_resource!(errors = [])
      api_error(status: 422, errors: errors)
    end

    def api_error(status: 500, errors: [])
      puts errors.full_messages if errors.respond_to?(:full_messages)

      render json: Api::V1::ErrorSerializer.new(status, errors).as_json,
        status: status
    end
end
