$adapter = "memory"

def add_to_search_path path
  $: << File.expand_path(File.dirname(__FILE__) + "/../#{path}")
end

[
  "production",
  "production/login/players",
  "production/main/players",
  "production/main",
  "production/__resources/gems/twitter-0.3.7/lib"
].each {|path| add_to_search_path path}

require 'rubygems'
require 'spec'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../production")

require 'limelight/specs/spec_helper'
require "twitter"
require "main"