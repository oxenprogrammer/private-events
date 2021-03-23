class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    logger.debug "The current event in the log: #{@event}"
    email = params[:email]
    logger.debug "Invitations in the log: #{params[:email]}"
    old_invitee = User.find_by(email: email)
    logger.debug "The new_invitee in the log: #{old_invitee}"

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
      @user = User.new(user_params)
      logger.debug "The new user I am trying to create: #{@user.email}"
      @user.password = '123456'
      @user.password_confirmation = '12345'

      if @user.save
        new_invitee = User.find_by(email: email)
        @invitation = @event.invitations.build(invitee_id: new_invitee.id)
        @invitation.event_id = @event.id
        @invitation.invitee_id = @invitee.id

        if @invitation.save
          redirect_to event_path(@event.id)
        else
          render :new
        end
      end
    end
  end

  def invitation_params
    params.permit(:name, :email, :authenticity_token, :commit, :id)
  end

  def user_params
    params.permit(:name, :email)
  end

  private :invitation_params, :user_params
end
