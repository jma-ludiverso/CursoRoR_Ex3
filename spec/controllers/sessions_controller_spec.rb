require 'spec_helper'

describe SessionsController do

	describe "#create" do
	    it "redirect to orders path after login" do
			post :create, post: { :email => 'juanma@ludiverso.com', :password => 'pepe'}
	      	expect(response).to redirect_to(orders_path)
	    end
	end

end
