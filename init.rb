require 'redmine'

require 'wiki_sidebar_toc_capture_helper_patch'

Redmine::Plugin.register :redmine_wiki_sidebar_toc do
  name 'Wiki sidebar toc plugin'
  author 'Just Lest'
  description ''
  version '0.0.1'
end
