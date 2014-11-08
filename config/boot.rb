require 'rubygems'

# Set up gems listed in the Gemfile.
File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
