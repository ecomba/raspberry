module Main
  prop_reader :tweets
  prop_reader :new_tweet
  
  def scene_opened(e)
    tweets.update
  end

end