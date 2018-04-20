Rails.application.config.content_security_policy do |p|
	if Rails.env.development?
		p.script_src :self, :https, :unsafe_eval
		p.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035'
	else
		p.script_src :self, :https
	end
end
