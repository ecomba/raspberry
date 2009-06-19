tweets {
  width "100%"
  height "80%"
  padding 5
  vertical_scrollbar "on"
}

tweet {
  width "100%"
  border_color "#9C9779"
  border_width 1
  margin 2
  rounded_corner_radius 10
  padding 10
  background_color "#333333"
}

tweet_style {
  text_color "#CCCCCC"
  font_size "14"
}

tweet_username {
  extends :tweet_style
  text_color "8CC63F"
  width "20%"
}

tweet_text {
  extends :tweet_style
  width "80%"
}

post_tweet {
  padding 10
  margin 2
}