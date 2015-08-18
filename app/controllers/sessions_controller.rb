class SessionsController < ApplicationController
  def create
    user = FacebookUser.koala(request.env['omniauth.auth']['credentials'])
    redirect_to admin_root_path
    # @user = FacebookUser.first
    # redirect_to admin_root_path
		# auth_hash = request.env['omniauth.auth']
		# raise request.env.inspect
		# auth_hash['credentials']['token']
		# render :text => auth_hash.inspect
  end
end
