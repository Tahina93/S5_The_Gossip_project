class UserController < ApplicationController
  def show
    @author = User.find(params[:id])
  end

  def hidden
    @person = params[:person]
  end
end
