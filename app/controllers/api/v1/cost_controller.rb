class Api::V1::CostController < ApplicationController

  def get_cost
    query_term = params[:searchArray]
    
    response = HTTParty.get("https://api.foursquare.com/v2/venues/#{query_term}/menu?client_id=RE3APGKQZOA2FCGSCF51X02RD10LJRU11JY2KD4R2VQWCXIU&client_secret=BH2GEJ4RZODQF3RLVZCMXQQWZB2Q4CKMRXTZJZUB00KPDPA0&v=20170908", format: :plain)
    json = JSON.parse(response, {symbolize_names: true})
    menu = json[:response][:menu][:menus][:items][0][:entries][:items]
    render :json => {menu: menu}
  end

end
