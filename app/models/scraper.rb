require 'net/http'

class Scraper
  attr_reader :document

  def initialize(url)
    response = Net::HTTP.get(URI(url))
    @document = Nokogiri::HTML(response)
  end

  def to_text(css_selector)
    @document.at_css(css_selector).text
  end

  def is_present?(css_selector)
    @document.at_css(css_selector).present?
  end
end