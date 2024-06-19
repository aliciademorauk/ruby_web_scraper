require 'net/http'

class Scraper
  def response_to_document()
    Nokogiri::HTML(Net::HTTP.get(URI(url)))
  end

  def self.text(url, css_selector:)
    response_to_document.at_css(css_selector).text
  end
end