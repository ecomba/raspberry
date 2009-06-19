module PostTweet
  prop_reader :tweets
  def button_pressed(e)
    tweet = scene.find("new_tweet")
    scene.production.twitter.post(tweet.text)
    tweet.text = ""

    tweets.update
  end
  
end