module Main
  prop_reader :tweets

  def scene_opened(e)
    tweets.update
  end

end