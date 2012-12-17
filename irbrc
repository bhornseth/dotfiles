require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT]  = true

%w(rubygems pp wirble).each do |lib|
  begin
    require lib 
  rescue LoadError => e
    puts "Error loading #{lib}, need to run `gem install #{lib}'!"
  end
end

if defined?(Wirble)
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
end
