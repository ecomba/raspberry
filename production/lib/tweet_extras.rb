module TweetExtras

  module ClassMethods
    
  end
  
  module InstanceMethods
    def tweet
      return parent.parent.tweet
    end

    def mouse_clicked(e)
      scene.new_tweet.text = update_tweet_box
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
  
end