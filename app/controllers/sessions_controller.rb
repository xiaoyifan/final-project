class SessionsController < ApplicationController

  def create
    data = request.env['omniauth.auth']
    user = User.find_by_uid(data['uid'])
    user ||= User.create uid: data['uid']
    session[:user_id] = user.id
    redirect_to products_url, notice: "Welcome back!"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Good day!"
  end
end
