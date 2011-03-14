module Lyndon
  class Delegate
    def webView(sender, didFinishLoadForFrame:frame)
      puts "Got here!"
      NSApplication.sharedApplication.stop(self)
    end
    
    def webView(view, didFailLoadWithError:error, forFrame:frame)
      puts "Failed: #{error.localizedDescription}"
      NSApplication.sharedApplication.terminate nil
    end

    def webView(view, didFailProvisionalLoadWithError:error, forFrame:frame)
      puts "Failed: #{error.localizedDescription}"
      NSApplication.sharedApplication.terminate nil
    end
    
    def webView(sender, didStartProvisionalLoadForFrame:error)
      puts "Provisional load"
    end
  end
end