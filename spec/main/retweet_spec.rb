require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "main"

describe Main do
  
  before(:each) do
    user = mock("User", :screen_name => "twitter_user")
    status1 = mock('Status1', :text => "Tweet One", :user => user)
    status2 = mock('Status2', :text => "Tweet Two", :user => user)
    @twitter_client = mock(Twitter::Base, :timeline => [status1, status2])
    producer.production.twitter = @twitter_client
  end
  
  uses_scene :main
  
  it "should fill the new tweet text with the old tweet" do
    @scene.find_by_name("retweet")[0].mouse_clicked(nil)
    @scene.find("new_tweet").text.should == "RT @twitter_user: Tweet One"
  end

  it "should fill the new tweet text with the old tweet" do
    @scene.find_by_name("retweet")[1].mouse_clicked(nil)
    @scene.find("new_tweet").text.should == "RT @twitter_user: Tweet Two"
  end
   
end