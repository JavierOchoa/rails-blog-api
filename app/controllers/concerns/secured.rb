module Secured
  def authenticate_user!
    # Bearer xxxxxx
    token_regex = /Bearer (\w+)/
    # HEADER from auth
    headers = request.headers
    # verify is valid
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
      # verify token is from the user
      if(Current.user = User.find_by_auth_token(token))
        return
      end
    end

    render json: {error: 'Unauthorized'}, status: :unauthorized
  end
end