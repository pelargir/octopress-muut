# Title: Muut Comments tag for Jekyll
# Author: Matthew Bass http://www.matthewbass.com
# Description: Easily output a Muut comments section for a blog post
#
# Syntax {% muut_comments %}
#
# Output:
# <a class="muut" href="https://muut.com/i/site/comments"></a>
#

class MuutCommentsTag < Liquid::Tag
  def initialize(tag_name, muut_name, tokens)
    super
    @muut_name = muut_name
  end
  
  def render(context)
    muut_name = context.environments.first['site']['muut_name']
    page_title = context.environments.first['page']['title']
    page_url = anchorize(context.environments.first['page']['url'])
    %Q{<a class="muut" href="https://muut.com/i/#{muut_name}/blog#{page_url}"></a>}
  end
  
  def anchorize(url)
    parts = url.split("/").compact
    last = parts.pop
    parts.join("/") + "#" + last
  end
end

Liquid::Template.register_tag('muut_comments', MuutCommentsTag)
