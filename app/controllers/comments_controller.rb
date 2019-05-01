class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content: params[:content], user: User.find(11), gossip: Gossip.find(params[:gossip_id]))
    redirect_to gossip_path(params[:gossip_id])
  end
end
