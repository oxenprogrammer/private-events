class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @past_events = Event.find_past_events
    @upcoming_events = Event.find_upcoming_events

    my_events = Event.where(creator_id: current_user.id)
    @current_user_event = my_events || [{ title: 'No Personal Events at the Moment' }]

    my_attendance = Invitation.where(invitee_id: current_user.id).pluck(:event_id)
    @current_user_attendance = Event.where(id: my_attendance)
    @current_user_attendance
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the Private Events!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
