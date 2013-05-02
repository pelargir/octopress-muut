octopress-moot
================

Use Moot for Octopress post and page comments.

## Setup

### Install the plugin

Download the files in this repository. Copy the `.rb` and `.html` files into the corresponding directories in your Octopress instance. This might work:

``` bash
$ cd octopress-moot
$ find . \( -name '*.rb' -o -name '*.html' \) -exec cp {} /path/to/octopress/{} \;
```

Next, open the file `source/_includes/head.html` in your Octopress install and add this to the bottom:

``` md
{% include custom/moot_head.html %} 
```

To actually get the comments to appear at the bottom of each blog post, edit `source/_layouts/post.html` and add this immediately after the closing `</article>` tag:

``` md
{% if site.moot_name and page.comments == true %}
  <section>
    {% moot_comments %}
  </section>
{% endif %}
```

You can also add this code to `source/_layouts/page.html` if you want comments on your pages as well.

Make sure the metadata for your blog posts includes `comments: true` otherwise the comments won't show up.

Finally, open `_config.yml` and add the following line:

``` md
moot_name: <forum>
```

Replace "forum" with the fourm name you chose when you signed up for Moot.

## How to use the tag

This plugin adds the `moot_comments` tag to your Octopress install. This tag inserts a non-threaded Moot comments section on the current page. The tag doesn't take any arguments:

``` md
  {% moot_comments %}
```
