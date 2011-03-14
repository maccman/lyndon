module Lyndon
  module Delegate
    class UI
      attr_reader :runtime
      
      def initialize(runtime)
        @runtime = runtime
      end
    
      def webView(webView, addMessageToConsole:message)
        # Unfortunately, there isn't a better way of working this out
        is_error = message[:message].downcase.include?("error")
        puts message[:sourceURL] + ":" + message[:lineNumber].to_s if is_error
        puts message[:message]
      end
    end
  end
end
    