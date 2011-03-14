#
# It's pretty much that easy.
#

if !defined?(RUBY_ENGINE) || RUBY_ENGINE != 'macruby'
  abort "Lyndon requires MacRuby. http://www.macruby.org/"
end

framework 'WebKit'

require 'lyndon/runtime'
require 'lyndon/coercion'
require 'lyndon/script_object/ruby'
require 'lyndon/script_object/lyndon'
require 'lyndon/delegate/ui'
require 'lyndon/delegate/load'
require 'lyndon/tests'

module Lyndon
  JS_PATH = File.join(File.dirname(__FILE__), "js")
  
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
  
  def self.open(url)
    Runtime.new.open(url)
  end
end
