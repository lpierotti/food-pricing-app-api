class RestaurantsController < ApplicationController

	def find_restaurants
		query_term = params[:restaurant][:searchTerm]
		response = HTTParty.get("https://api.foursquare.com/v2/venues/search?near=%27New%20York,%20NY%27&q=#{query_term}&categoryId=4d4b7105d754a06374d81259&client_id=RE3APGKQZOA2FCGSCF51X02RD10LJRU11JY2KD4R2VQWCXIU&client_secret=BH2GEJ4RZODQF3RLVZCMXQQWZB2Q4CKMRXTZJZUB00KPDPA0&v=20170908", format: :plain)
		json = JSON.parse(response, {symbolize_names: true})
		venues = json[:response][:venues]
		render :json => {venues: venues}
	end

	def find_menu
		query_term = params[:restaurant][:venueId]
		response = HTTParty.get("https://api.foursquare.com/v2/venues/#{query_term}/menu?client_id=RE3APGKQZOA2FCGSCF51X02RD10LJRU11JY2KD4R2VQWCXIU&client_secret=BH2GEJ4RZODQF3RLVZCMXQQWZB2Q4CKMRXTZJZUB00KPDPA0&v=20170908", format: :plain)
		json = JSON.parse(response, {symbolize_names: true})
		menu = json["response"]["menu"]["menus"]["items"][0]["entries"]["items"]
		render :json => {menu: menu}
	end

end
