module LoginHelper

	def render_loginhelper
		unless user_logged?						 
			html = link_to(t("login.signin"), sessions_path, :method => :new)
			html << " | "
			html << link_to(t("login.signup"), new_user_path)
		else 
			html = link_to(t("login.signout"), session_path, :method => :delete)
		end
		html
	end

end