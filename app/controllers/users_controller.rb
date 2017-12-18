class UsersController < ApplicationController
  def create
    uid = SecureRandom.hex
    user = User.new(name: params[:user][:name], uid: uid)

    if user.save
      cookies[:user_uid] = { value: uid, expires: 1.year.from_now }
    end

    redirect_to root_path
  end
end
