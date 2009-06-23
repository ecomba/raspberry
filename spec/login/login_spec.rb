require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "login"

describe Login do
  
  uses_scene :login
  
  it "should call twitter api" do
    @scene.find('username').text = 'username'
    @scene.find('password').text = 'password'

    twitter_client = mock('twitter_client')
    oauth = mock('oauth')
    Twitter::OAuth.should_receive(:new).with("pMe6T7StYDu0Khwg9FlHgQ", "RtnXrHIfRbiqOkpXinAK3mRo1T5m1jPAwwkOsZBjwA").and_return(oauth)
    oauth.should_receive(:authorize_from_access).with(@scene.find('username').text, @scene.find('password').text)
    Twitter::Base.should_receive(:new).with(oauth).and_return(twitter_client)
    @scene.should_receive(:load).with("main")
    login = @scene.find('login')
    login.should_not be_nil
    login.button_pressed(nil)

    @scene.production.twitter.should_not be nil
  end
  it "should have a username field" do
    prop = scene.find('username')
    
    prop.should_not be_nil
    prop.players.should include('text_box')
  end
  
  it "should have a password field" do
    prop = scene.find('password')
    prop.should_not be_nil
    prop.players.should include('password_box')
  end
  
  it "should have a button" do
    prop = scene.find('login')
    
    prop.should_not be_nil
    prop.text.should == "Login"
    prop.name.should include('button')
  end
  
end
