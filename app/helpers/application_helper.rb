module ApplicationHelper
  def markdown(text)
    options = {
      :hard_wrap        => true,
      :filter_html      => true,
      :autolink         => true,
      :no_intraemphasis => true,
      :fenced_code      => true,
      :gh_blockcode     => true
    }

    render = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(render, {})

    markdown.render(text).html_safe
  end

  def snippet(text, omission = '...', length = 300)
    truncate_html(text, :length => length, :omission => omission)
  end
end
