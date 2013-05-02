# Title: Moot Comments tag for Jekyll
# Author: Matthew Bass http://www.matthewbass.com
# Description: Easily output a Moot comments section for a blog post
#
# Syntax {% moot_comments %}
#
# Output:
# <a class="moot" title="Page title" href="https://api.moot.it/site/page#title"></a>
#

class MootCommentsTag < Liquid::Tag
  def initialize(tag_name, moot_name, tokens)
    super
    @moot_name = moot_name
  end
  
  def render(context)
    moot_name = context.environments.first['site']['moot_name']
    page_title = context.environments.first['page']['title']
    page_url = anchorize(context.environments.first['page']['url'])
    %Q{<a class="moot" title="#{page_title}" href="https://api.moot.it/#{moot_name}/blog#{page_url}"></a>}
  end
  
  def anchorize(url)
    parts = url.split("/").compact
    last = parts.pop
    parts.join("/") + "#" + last
  end
end

Liquid::Template.register_tag('moot_comments', MootCommentsTag)
