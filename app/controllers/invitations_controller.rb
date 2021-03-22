class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    # @current_event = Event.find(params[:id])
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def create
    @invitation = Invitation.new
    @current_event = Event.find(params[:id])
    @invitee = User.new(user_params)

    new_invitee = User.find_by(email: @invitee.email)

    if new_invitee
      @invitation.invitee_id = new_invitee.id
      @invitation.event_id = @current_event.id

      if @invitation.save
        redirect_to @user
      else
        render :new
      end
    else
      @invitee.password = '123456'
      @invitee.password_confirmation = '12345'

      if @invitee.save
        @invitation.event_id = @current_event.id
        @invitation.invitee_id = @invitee.id

        if @invitation.save
          redirect_to @user
        else
          render :new
        end
      end
    end
  end

  def invitation_params
    params.require(:invitation).permit(:event_id, :invitee_id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private :invitation_params, :user_params
end
