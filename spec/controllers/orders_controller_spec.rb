require 'spec_helper'

describe OrdersController do

	it "require login" do
		get :new, locale: 'es'
		expect(response).to redirect_to(root_url)	
	end

end
