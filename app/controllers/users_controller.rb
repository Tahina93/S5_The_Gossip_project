class UsersController < ApplicationController
  def new
    puts "asticot"
    @cities = get_city
  end

  def create
    begin
      @user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        age:params[:age],
        city: City.find(params[:city]),
        description: params[:description],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )

      if @user.save
        flash.now[:success] = "Nouvel utilisateur enregistré"
        redirect_to root_path
      else
        flash.now[:error] = "Tu as du oublier de remplir des informations mon petit chat"
        @cities = get_city
        render 'new'
      end
    rescue Exception => e
      flash.now[:error] = e.message
      @cities = get_city
      render "new"
    end    
  end
  
  def show
    @author = User.find(params[:id])
  end

  def hidden
    @person = params[:person]
  end

 private

 def get_city
   City.all.order("name")
 end

end


