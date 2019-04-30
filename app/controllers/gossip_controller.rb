class GossipController < ApplicationController
  def index()
    @success=params[:success]
    @gossips = Gossip.all.reverse
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
  end
  
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find(11))

    if @gossip.save  
      redirect_to gossip_index_path(success: true)
    else
      render 'new'
    end
  end
end
