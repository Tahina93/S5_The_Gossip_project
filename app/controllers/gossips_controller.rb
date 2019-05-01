class GossipsController < ApplicationController
  def index()
    @success=params[:success]
    @gossips = Gossip.all.reverse
  end

  def show
    @success = params[:success]
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
    @gossip = get_gossip
    if @gossip.update(
      title: params[:title],
      content: params[:content]
      )
      redirect_to gossip_path(params[:id], success: true)
    else
      render :edit
    end
  end


  private

  def get_gossip
    Gossip.find(params[:id]) 
  end
end
