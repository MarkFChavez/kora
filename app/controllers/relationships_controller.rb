class RelationshipsController < ApplicationController
  def create
    user = User.find params[:followable]
    current_user.follow_user! user  

    redirect_to dashboard_path, notice: "You are now following #{user.email}"

  rescue Exceptions::UnableToFollowError
    redirect_to dashboard_path, alert: "Error occurred."
  end

  def destroy
    user = User.find params[:id]
    
    if current_user.unfollow_user! user
      redirect_to dashboard_path, notice: "You unfollowed #{user.email}"
    else
      redirect_to dashboard_path, alert: "Erroc occurred."
    end
  end
end
