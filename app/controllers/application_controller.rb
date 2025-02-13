class ApplicationController < ActionController::API
  include JsonWebToken

  #before_action :authenticate_request

  private
    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      if decoded.nil?
        render json: { error: 'Unauthorized' }, status: :unauthorized
      else
        @current_user = User.find(decoded[:user_id])
      end
    end
end
