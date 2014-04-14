require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT]  = true

%w(rubygems pp).each do |lib|
  begin
    require lib 
  rescue LoadError => e
    puts "Error loading #{lib}, need to run `gem install #{lib}'!"
  end
end

if defined?(SparkApi)
  include SparkApi::Models
end
