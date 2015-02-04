class VisitorsController < ApplicationController

	def new
		@owner = Owner.new
		# render 'visitors/new'
		#flash.now[:notice] = 'Welcome!'
		#flash.now[:alert] = 'My birthday is soon'
		#Flash messages
		# - use flash.now when rendering a page
		# - use flash in the controller when redirecting to another page
		# ----- flash.now does not persist through redirects
		# i.e. flash can be sticky
	end

end