require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Main do
  before(:each) do
    paul = mock("User", :screen_name => "paulwpagel")
    colin = mock("User", :screen_name => "colin")
    status1 = mock('Status1', :text => "I love raspberry", :user => paul)
    status2 = mock('Status2', :text => "Check out the fruits!", :user => colin)
    @twitter_client = mock(Twitter::Base, :friends_timeline => [status1, status2])
    producer.production.twitter = @twitter_client
  end
  
  uses_scene :main
  
  it "should fill the new tweet text with Paul's screen_name" do
    @scene.find_by_name("reply")[0].mouse_clicked(nil)
    @scene.find("new_tweet").text.should == "@paulwpagel "
  end

  it "should fill the new tweet text with Colin's screen_name" do
    @scene.find_by_name("reply")[1].mouse_clicked(nil)
    @scene.find("new_tweet").text.should == "@colin "
  end
end