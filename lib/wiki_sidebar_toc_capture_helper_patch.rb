module ActionView
  module Helpers
    module CaptureHelper
      def content_for_with_wiki_sidebar_toc(name, content = nil, &block)
        if name == :sidebar && params[:controller] == 'wiki' && params[:action] == 'index'
          ivar = "@content_for_#{name}"
          instance_variable_set(ivar, "#{instance_variable_get(ivar)}#{@wiki_sidebar_toc}")
        end
        content_for_without_wiki_sidebar_toc(name, content, &block)
      end

      alias_method_chain :content_for, :wiki_sidebar_toc
    end
  end
end
