class UserService
  def self.create_user(params)
    user = User.new(params)
    if user.save
      return user
    else
      raise StandardError, user.errors.full_messages.to_sentence
    end
  end
end