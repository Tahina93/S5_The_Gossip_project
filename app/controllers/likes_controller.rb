class LikesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]

  def create
    @like = Like.create(user: current_user, gossip: Gossip.find(params[:gossip_id]))
    puts @like.errors.messages
    redirect_to gossip_path(params[:gossip_id])
  end

  def destroy
    likes = Like.where(user: current_user, gossip: Gossip.find(params[:id]))
    likes.each do |like|
      like.destroy
    end
    redirect_to gossip_path(params[:gossip_id])
  end
end
