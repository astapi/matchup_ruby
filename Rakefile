require 'bundler/setup'
require 'grape/activerecord/rake'
require 'grape-route-helpers'
require 'grape-route-helpers/tasks'

namespace :db do
  task :environment do
    require_relative 'config/environment'
  end
end

task :environment do
  require File.expand_path('app/api/app.rb', File.dirname(__FILE__))
end
