require 'rubygems'
require 'sinatra'
require 'erb'

require 'mini_magick'

get '/' do
  @your_name = params[:your_name] ? params[:your_name] : 'Jun Tang'

  path = File.dirname(__FILE__)
  public_path = path + '/public'

  img = MiniMagick::Image.from_file(public_path + '/diploma.jpg')
  img.combine_options do |c|
    c.pointsize '24'
    c.font public_path + '/OLDENGLT.TTF'
    c.draw "text 299,230 '#{@your_name}'"
    c.fill("#FF0000")
  end

  img.write(public_path + '/output.jpg')

  @image_tag = '<img src="/output.jpg" />'

  erb :index
end
