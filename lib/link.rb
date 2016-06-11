class LinkItem
  include Listable
  attr_reader :description, :site_name, :itemtype

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
    @itemtype = "link"
  end

  def format_name
    @site_name ? @site_name : ""
  end

  def details
    format_description(@description) + "site name: " + format_name
  end
end
