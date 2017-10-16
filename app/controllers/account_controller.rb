class AccountController < ApplicationController
  #after_action :verify_authorized
  #before_action :authenticate_user!
  def index
    #make it so only users can see their own applications.
    @applications = RegisteredApplication.all.select{|x| x.user_id == current_user.id}
  end

end
