module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def is_gossip_author?
    unless current_user == User.find_by(gossips: Gossip.find(params[:id]))
      flash[:danger] = "Tu n'es pas l'auteur de ce potin."
      redirect_to root_path
    end
  end

  def is_comment_author?
    unless current_user == User.find_by(comments: Comment.find(params[:id]))
      flash[:danger] = "Tu n'es pas l'auteur de ce commentaire."
      redirect_to root_path
    end
  end
end
