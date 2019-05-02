class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new, :edit, :destroy]
  def index()
    @success=params[:success]
    @gossips = Gossip.order(:id).reverse
  end

  def show
    @success = params[:success]
    @gossip = get_gossip
    @comments = Comment.where(gossip_id: @gossip.id)
  end

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)

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

  def destroy
    @gossip = get_gossip
    @gossip.destroy

    redirect_to gossips_path
  end

  private

  def get_gossip
    Gossip.find(params[:id])
  end


end
