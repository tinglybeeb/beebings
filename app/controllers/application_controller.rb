class ApplicationController < ActionController::Base

	def hello
		render html: "hello beeb!"
	end

end
