require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Main do
  
  before(:each) do
    user = mock("User", :screen_name => "twitter_user")
    status = mock('Status', :text => "Tweet One", :user => user)
    @twitter_client = mock(Twitter::Base, :friends_timeline => [status])
    producer.production.twitter = @twitter_client
  end
  
  uses_scene :main
  
  it "should show tweets" do
    @scene.find("tweet_1").children[0].children[0].text.should == "@twitter_user: "
    @scene.find("tweet_1").children[1].text.should == "Tweet One"
    @scene.find("tweet_1").name.should == "tweet"
  end
  
  it "should have a retweet button" do
    @scene.find("tweet_1").children[0].children[1].text.should == "RT"
  end
  
  it "should have a text field and button for a new tweet" do
    new_tweet = @scene.find("new_tweet")
    new_tweet.should_not be_nil
    new_tweet.players.should include("text_area")
    post_tweet = @scene.find("post_tweet")
    post_tweet.should_not be_nil
    post_tweet.text.should == "Tweet"
    post_tweet.players.should include("button")
  end
  
  it "should tweet" do
    @twitter_client.should_receive(:update).with("Hello, world.")

    @scene.find("new_tweet").text = "Hello, world."
    @scene.find("post_tweet").button_pressed(nil)    
  end
  
  it "should clear text after successfully tweeting" do
    @twitter_client.stub!(:update)
    @scene.find("new_tweet").text = "Hello, world."
    @scene.find("post_tweet").button_pressed(nil)
    
    @scene.find("new_tweet").text.should == ""
  end
  
  it "should update tweets when you tweet" do
    @twitter_client.stub!(:update)
    @scene.find("new_tweet").text = "Hello, world."
    prop = mock(Limelight::Prop)
    prop.should_receive(:update)
    @scene.find('post_tweet').should_receive(:tweets).and_return(prop)

    @scene.find("post_tweet").button_pressed(nil)
  end
  
end
