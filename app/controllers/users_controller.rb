class UsersController < ApplicationController
  def new
    # render the new user page
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"]) # store encrypted valuye into table
    @user.save
    redirect_to "/"
  end
end
