class UsersController < ApplicationController
  def new
    @cities = City.all.order("name")
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      age:params[:age],
      city: City.find(params[:city]),
      description: params[:description],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation0]
    )

    if @user.save
      flash.now[:success] = "Nouvel utilisateur enregistré"
      redirect_to root_path
    else
      flash.now[:error] = "Erreur d'enregistrement"
      render now
    end
  end
  
  def show
    @author = User.find(params[:id])
  end

  def hidden
    @person = params[:person]
  end
end
