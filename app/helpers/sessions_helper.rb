module SessionsHelper


  def login(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @user = nil
  end
end
