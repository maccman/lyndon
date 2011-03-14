#
# It's pretty much that easy.
#

if !defined?(RUBY_ENGINE) || RUBY_ENGINE != 'macruby'
  abort "Lyndon requires MacRuby. http://www.macruby.org/"
end

framework 'WebKit'

require 'lyndon/runtime'
require 'lyndon/coercion'
require 'lyndon/ruby'
require 'lyndon/delegate'

module Lyndon
  def self.eval(js)
    Runtime.new.eval(js)
  end

  def self.eval_file(file)
    contents = File.read(File.expand_path(file))
    eval(contents)
  end

  def self.parse(dom)
    Runtime.new(:dom => dom).to_s
  end
  
  def self.navigate(url)
    Runtime.new.navigate(url)
  end
end
