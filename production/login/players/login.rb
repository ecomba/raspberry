require "twitter"

module Login
  prop_reader :username
  prop_reader :password
  
  def button_pressed(event)
    twitter = Twitter::Base.new(username.text, password.text)
    twitter.timeline.each do |status|
      puts "#{status.user} says #{status.text}"
    end
  end
  
end