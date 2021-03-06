class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :destroy]
  before_action :is_comment_author?, only: [:edit, :update, :destroy]
  def create
    @comment = Comment.create(content: params[:content], user: current_user, gossip: Gossip.find(params[:gossip_id]))
    redirect_to gossip_path(params[:gossip_id])
  end

  def edit
    @comment = get_comment
    puts "*" * 60
    puts params
    puts "*" * 60
  end

  def update
    @comment = get_comment
    if @comment.update(
      content: params[:content]
      )
      redirect_to gossip_path(params[:gossip_id])
    else
      render :edit
    end
  end

  def destroy
  	puts params
    @comment = get_comment
    @comment.destroy

    redirect_to gossip_path(params[:gossip_id])
  end

  private

  def get_comment
  	Comment.find(params[:id])
  end

end
