class Api::V1::RestaurantsController < ApplicationController

	def find_restaurants
		query_term = params[:restaurant][:searchTerm]
		response = HTTParty.get("https://api.foursquare.com/v2/venues/search?near=%27New%20York,%20NY%27&query=#{query_term}&categoryId=4d4b7105d754a06374d81259&client_id=RE3APGKQZOA2FCGSCF51X02RD10LJRU11JY2KD4R2VQWCXIU&client_secret=BH2GEJ4RZODQF3RLVZCMXQQWZB2Q4CKMRXTZJZUB00KPDPA0&v=20170908", format: :plain)
		json = JSON.parse(response, {symbolize_names: true})
		venues = json[:response][:venues]
		render :json => {venues: venues}
	end

end
