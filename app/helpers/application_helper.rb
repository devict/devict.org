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

  def first_p(html)
    doc = Nokogiri::HTML.parse(html)
    paras = doc.xpath('//p')
    paras[0].to_s
  end

  def self.first_p(html)
    doc = Nokogiri::HTML.parse(html)
    paras = doc.xpath('//p')
    paras[0].to_s
  end

  # Compares the provided link_path to the current page to set an "active"
  # class so your current page is highlighted in the navigation bar.
  #
  # Credits to skilldrick at http://stackoverflow.com/questions/3705898/best-way-to-add-current-class-to-nav-in-rails-3
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:dd, :class => class_name) do
      link_to link_text, link_path
    end
  end

end
