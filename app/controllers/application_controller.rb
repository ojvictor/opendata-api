class ApplicationController < ActionController::API
  def routing_forbidden
    render json: { error: 'Forbidden' }, status: :forbidden
  end

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end

  def routing_error
    render json: { error: 'Route not found' }, status: :not_found
  end
end
