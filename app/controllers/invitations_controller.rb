class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @event = Event.find(params[:id])
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])

    if current_user.id != @event.creator_id
      flash[:warning] = 'You can only invite users to your own created event'
      render :new
    else
      old_invitee = User.find_by(email: params[:email])

      if old_invitee
        @invitation = @event.invitations.build(invitee_id: old_invitee.id)
        user_exist(old_invitee, @invitation, @event)
      else
        flash[:danger] = 'User not found in the Database'
        render :new
      end
    end
  end

  def invitation_params
    params.permit(:name, :email, :authenticity_token, :commit, :id)
  end

  def user_exist(old_invitee, invitation, event)
    invitation.invitee_id = old_invitee.id
    invitation.event_id = event.id

    if invitation.save
      flash[:success] = "#{old_invitee.name} has successfully been invited"
      redirect_to event_path(event.id)
    else
      flash[:danger] = 'Failed to save Invitation, please try again'
      render :new
    end
  end

  private :invitation_params, :user_exist
end
