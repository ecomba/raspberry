require "twitter"

module Login
  prop_reader :username
  prop_reader :password
  
  def button_pressed(event)
		# oauth = Twitter::OAuth.new("pMe6T7StYDu0Khwg9FlHgQ", "RtnXrHIfRbiqOkpXinAK3mRo1T5m1jPAwwkOsZBjwA")
		# oauth.authorize_from_access(username.text, password.text)
		scene.production.twitter = Twitter::Base.new(Twitter::HTTPAuth.new(username.text, password.text))
    # scene.production.twitter = Twitter::Base.new(username.text, password.text)
    scene.load("main")
  end
  
end