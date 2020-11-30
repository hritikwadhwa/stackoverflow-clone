module SessionsHelper
  def log_in(user)
    session[:current_user] = user.id
    @current_user = User.find(user.id)
  end
  def logged_in?
    !session[:current_user].nil?
  end
  def log_out
    session.delete(:current_user)
    @current_user = nil
  end
end
