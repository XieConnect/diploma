require 'rubygems'
require 'sinatra'
require 'diploma'

set :env, :production
disable :run

run Sinatra::Application
