class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    email = params[:email]
    old_invitee = User.find_by(email: email)

    if old_invitee
      @invitation = @event.invitations.build(invitee_id: old_invitee.id)
      @invitation.invitee_id = new_invitee.id
      @invitation.event_id = @event.id

      if @invitation.save
        redirect_to event_path(@event.id)
      else
        render :new
      end
    else
      render :new
    end
  end

  def invitation_params
    params.permit(:name, :email, :authenticity_token, :commit, :id)
  end

  private :invitation_params
end
