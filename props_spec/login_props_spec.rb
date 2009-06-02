require File.dirname(__FILE__) + '/spec_helper'
require 'limelight/specs/spec_helper'

describe "Props" do  
  uses_scene :login

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
    prop.players.should include('button')
  end
  
end