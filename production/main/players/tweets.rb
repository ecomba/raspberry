module Tweets

  def update
    self.remove_all
    scene.production.twitter.timeline.each_with_index do |status, index|
      tweet_prop = Limelight::Prop.new(:id => "tweet_#{index + 1}", :name => "tweet")
      tweet_prop << Limelight::Prop.new(:name => "tweet_username", :text => "@#{status.user.screen_name}: ")
      tweet_prop << Limelight::Prop.new(:name => "tweet_text", :text => status.text)
      self << tweet_prop
    end
  end  

end