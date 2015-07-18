$:.unshift File.expand_path("../../lib", __FILE__)

# test_helper.rb
ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'sinatra/base'

require 'app'

#require File.expand_path 'app.rb', __FILE__
