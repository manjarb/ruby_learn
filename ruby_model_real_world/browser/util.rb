class Page
  def initialize(url)
    @uri = URI.parse(url)

  end
  
  # make request
  def fetch!
    # Shortcut
    puts "url > #{@uri}"
    puts "Fetching"
    @response = Net::HTTP.get_response(@uri)
    @html_doc = Nokogiri::HTML(@response.body)
    # #p @response.code
    # #p @response.body
    # puts ""
  end
  
  # return title
  def title
    title = @html_doc.css('title')[0].text
    puts "Title: #{title}"
    content_length = @html_doc.css('body').text.length
    puts "Content length: #{content_length} characters"
  end
  
  #return links
  def links
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
    links = @html_doc.css('a')
    puts "Links:"
    links.each { |x|
      puts x['href']
    }
    puts ""
  end
end