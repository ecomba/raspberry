main_container {

  post_tweet {
    input :players => "text_area", :id => "new_tweet", :width => 400
    input :players => "button post_tweet", :id => "post_tweet", :text => "Tweet"
  }
  
  tweets :id => "tweets"
}