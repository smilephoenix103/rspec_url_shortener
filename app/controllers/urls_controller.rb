class UrlsController < ApplicationController
	def index
	end


	def create
		short_url = SecureRandom.base64[0..8]
		url = Url.new(long_url: params[:long_url], short_url: short_url)
		if url.save
			url.save
			redirect_to urls_path
		else
			@errors = "can't be blank"
			redirect_to
		end
	end


end
