# test_helper.rb
ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'sinatra/base'

require File.expand_path '../../app.rb', __FILE__
