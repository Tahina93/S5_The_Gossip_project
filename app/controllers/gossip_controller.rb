class GossipController < ApplicationController
  def index
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
end
