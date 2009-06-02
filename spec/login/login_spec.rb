require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'limelight/specs/spec_helper'
require "login"

describe Login do
  
  uses_scene :login
  
  it "should call twitter api" do
    @scene.find('username').text = 'username'
    @scene.find('password').text = 'password'

    twitter_client = mock('twitter_client')
    Twitter::Base.should_receive(:new).with("username", "password").and_return(twitter_client)
    
    login = @scene.find('login')
    login.should_not be_nil
    login.button_pressed(nil)
  end
end
