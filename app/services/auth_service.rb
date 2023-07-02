class AuthService

  def encrypt_token(id)
    token = "rahasia_#{id}_#{DateTime.now.utc}"
    Base64.strict_encode64(token)
  end

  def decrypt_token_and_verify(headers)
    token = headers
    token.slice! 'Bearer '
    decode_token = Base64.strict_decode64(token)
    data = decode_token.split('_')
    @user = User.find(data[1].to_i)
    if @user.present?
      return false unless @user.token == 'rahasia'
      return false unless DateTime.now.utc <= (DateTime.parse(data[2]).utc + 6.hour)
      @user
    else
      return false
    end
  end
end