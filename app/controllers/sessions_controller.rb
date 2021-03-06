class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to root_path
    else
      flash.now[:danger] = "e-mail ou mot de passe invalide(s)"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
