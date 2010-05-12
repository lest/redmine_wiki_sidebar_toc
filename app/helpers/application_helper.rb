require_dependency 'application_helper'

module ApplicationHelper
  def textilizable_with_wiki_sidebar_toc(*args)
    content = textilizable_without_wiki_sidebar_toc(*args)
    if args.first.is_a?(WikiContent) && params[:controller] == 'wiki' && params[:action] == 'index'
      @wiki_sidebar_toc = ''
      headers = content.scan(%r{<(h([1234])).*?>(.*?)<a.*?href="(.*?)".*?>.*?</a></\1>}).to_a
      if headers.size > 1
        @wiki_sidebar_toc << "<h3>#{t(:wiki_sidebar_toc_title)}</h3>"
        headers.each do |matches|
          h_level = matches[1].to_i - 1
          h_content = matches[2]
          h_href = matches[3]
          @wiki_sidebar_toc << "<a href=\"#{h(h_href)}\" style=\"display: block; margin-left: #{h_level * 10}px\">#{h_content}</a>"
        end
      end
    end
    content
  end

  alias_method_chain :textilizable, :wiki_sidebar_toc
end
