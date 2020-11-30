class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to questions_path
    end
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user and user.authenticate(params[:password])
      log_in user
      print "Success"
    else
      print "Fail"
      flash[:danger] = "Login failed"
      return 'new'
    end
  end

  def destroy
    log_out
    redirect_to sessions_new_path
  end
end
