require './config/environment'
require './main'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

map '/' do
  run ApiApp
end
