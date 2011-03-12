# http://developer.apple.com/documentation/Cocoa/Reference/WebKit/ObjC_classic/index.html

module Lyndon
  class Runtime
    def initialize(options = {})
      @webView = WebView.new
      @webView.setFrameLoadDelegate(Delegate.new)

      @scripter = @webView.windowScriptObject
      
      unless options[:sandbox]
        @scripter.setValue(Ruby.new, forKey:"Ruby")
      end

      load_dom(options[:dom]) if options[:dom]
      
      unless options[:sandbox]
        eval_file File.dirname(__FILE__) + '/../js/lyndon'
      end
    end
    
    def url=(url)
      url = url.kind_of?(String) ? NSURL.alloc.initWithString(url) : url
      @webView.mainFrame.loadRequest(NSURLRequest.requestWithURL(url))
    end
    alias_method :navigate, :url=

    def eval(js)
      @scripter.evaluateWebScript(js)
    end

    def eval_file(file)
      if File.exists? file = File.expand_path(file.to_s)
        eval File.read(file)
      elsif File.exists? file + '.js'
        eval File.read(file + '.js')
      end
    end

    def load_dom(dom, base_url = nil)
      @dom = File.exists?(dom) ? File.read(dom) : dom
      @webView.mainFrame.loadHTMLString(@dom, baseURL:base_url)
      NSApplication.sharedApplication.run
    end

    def to_s
      @dom ? html_source : super
    end

    def html_source
      '<html>'+eval("document.documentElement.innerHTML")+'</html>'
    end
  end
end
