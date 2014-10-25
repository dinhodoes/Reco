class PartialsController < ApplicationController

	def user_modal

		@user = User.all

    respond_to do |format|
      format.html
      format.js
    end
  end
	
end
