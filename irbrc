require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:PROMPT_MODE] = :SIMPLE

%w[wirble].each do |gem|
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize

  # oh my. need way more colors to make this look OK
  colors = Wirble::Colorize.colors.merge({
    :refers             => :nothing,
    :comma              => :nothing,
    :open_hash          => :nothing,
    :close_hash         => :nothing,
    :open_string        => :dark_gray,
    :close_string       => :dark_gray,
    :string             => :nothing,
    :symbol             => :cyan,
    :symbol_prefix      => :cyan
   
  })

  # set the colors used by Wirble
  Wirble::Colorize.colors = colors

  rescue LoadError
  end
end
