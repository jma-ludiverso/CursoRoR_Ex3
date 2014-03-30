module LoginHelper

	def render_loginhelper
		unless user_logged?						 
			html = link_to('Sign in', sessions_path, :method => :new)
			html << " | "
			html << link_to(link_to 'Sign up', new_user_path)
		else 
			html = link_to('Sign out', session_path, :method => :delete)
		end
		html
	end

end