require "twitter"

module Login
  prop_reader :username
  prop_reader :password
  
  def button_pressed(event)
    scene.production.twitter = Twitter::Base.new(username.text, password.text)
    scene.load("main")
  end
  
end