# Loading Hacker News Into Objects

# We now need code which does the following:

# Instantiates a Post object
# Parses the Hacker News HTML
# Creates a new Comment object for each comment in the HTML, adding it to the Post object in (1)
# Ship it!

# Command line + parsing the actual Hacker News

# We're going to learn two new things: the basics of parsing command-line arguments and how to fetch HTML for a website using Ruby. We want to end up with a command-line program that works like this:

# $ ruby hn_scraper.rb https://news.ycombinator.com/item?id=5003980
# Post title: XXXXXX
# Number of comments: XXXXX
# ... some other statistics we might be interested in -- your choice ...
# $

require 'net/http'
require 'nokogiri'
require 'uri'
require 'cgi'

class Post
	def initialize(url)
		# corresponding to the title on Hacker News, the URL the post points to, 
		# the number of points the post currently has, 
		# and the post's Hacker News item ID, respectively.
		@uri = URI.parse(url)
		@response = Net::HTTP.get_response(@uri)
		@html_doc = Nokogiri::HTML(@response.body)
		@title = @html_doc.search('title')
		@url = url
		@points = @html_doc.search('.score')
		@item_id = CGI.parse(@uri.query)['id'][0]
		@comment_list = []
	end

	def comments
		#returns all the comments associated with a particular post
		@comments = @html_doc.search('.athing')
		@comments_text = @html_doc.search('.comment')

	end

	def add_comment
		#takes a Comment object as its input and adds it to the comment list.
		@comments_text.each { |x|
			@comment_list << x.text
		}
	end
	def to_s
		puts "Post title: #{@title.text}"
		puts "Post Id: #{@item_id}"
		puts "Number of comments: #{comments.length}"
		puts "Points: #{@points.text}"
		puts "First Comments:"
		# @comment_list.each { |x|
		# 	puts x
		# 	puts ""
		# }
		puts @comment_list[0]

	end
end

class Comment

end

#post = Post.new("https://news.ycombinator.com/item?id=5003980")
post = Post.new(ARGV[0])
post.comments
post.add_comment
post.to_s

