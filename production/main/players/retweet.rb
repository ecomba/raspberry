module Retweet
  include TweetExtras
  
  def update_tweet_box
    "RT @#{tweet.user.screen_name}: #{tweet.text}"
  end
  
end