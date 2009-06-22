module Reply
  include TweetExtras
  
  def update_tweet_box
    "@#{tweet.user.screen_name} "
  end
end