class SessionsController < ApplicationController
  def new
    # render the login form in sessions/new.html.erb
  end

  def create
    # find the user in the user database to login
    @user = User.find_by({"email" => params["email"]})
    if @user.nil?
      redirect_to "/login"
      flash["notice"] = "Wrong email or you might not have an account"
    else
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome #{@user["username"]}!"
        redirect_to "/places"
      else
        redirect_to "/login"
        flash["notice"] = "Wrong password"
      end
    end

  end

  def destroy
    # logout user from the program
    session["user_id"] = nil
    flash["notice"] = "Goodbye. Go adventure!"
    redirect_to "/login"
  end
end
  