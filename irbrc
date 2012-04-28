require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

%w[wirble].each do |gem|
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
  rescue LoadError
  end
end
