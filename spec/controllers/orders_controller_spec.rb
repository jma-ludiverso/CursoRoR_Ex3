require 'spec_helper'

describe OrdersController do
	integrate_views 

	it "require login" do
		get :new
		expect(response).to be_success
		expect(response.status).to eq(200)	  		
	end

end
