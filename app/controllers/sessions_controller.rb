class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # log user in
    else
      # return errors
      flash[:danger] = 'Invalid email/password combination' # Try Again!
      render 'new'
    end
  end

  def destroy; end
end
