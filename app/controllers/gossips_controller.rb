class GossipsController < ApplicationController
  def index()
    @success=params[:success]
    @gossips = Gossip.all.reverse
  end

  def show
    @gossip = get_gossip
  end

  def new
  end
  
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find(11))

    if @gossip.save  
      redirect_to gossips_path(success: true)
    else
      render 'new'
    end
  end

  def edit
    @gossip = get_gossip
  end

  def update
    
  end


  private

  def get_gossip
    Gossip.find(params[:id]) 
  end
end
