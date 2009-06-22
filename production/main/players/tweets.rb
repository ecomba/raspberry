module Tweets

  def update
    self.remove_all
    scene.production.twitter.timeline.each_with_index do |status, index|
      self.build do
        tweet :id => "tweet_#{index + 1}", :tweet => status do
          tweet_nest do 
            tweet_username :text => "@#{status.user.screen_name}: "
            retweet :text => "RT"
            reply :text => "reply"
          end
          tweet_text :text => status.text
        end
      end
    end
  end  

end