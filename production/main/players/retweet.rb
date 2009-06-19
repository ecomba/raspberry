module Retweet
  
  def tweet
    return parent.parent.tweet
  end
  
  def mouse_clicked(e)
    scene.new_tweet.text = "RT @#{tweet.user.screen_name}: #{tweet.text}"
  end
  
end