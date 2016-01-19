require 'net/http'
require 'nokogiri'
require 'uri'

require_relative 'util'

class Browser

    def initialize
        @page = Page.new('http://jarbstudio.com/')
    end

    def run!
        # Run the browser
        # Display a prompt for a user
        # Parse their input
        # Display useful results by instantiating
        #   a new Page and calling methods on it.

        # Questions:
        #  1. How can a user quit the browser gracefully?
        #  2. How can a user ask for help, i.e., how do they know what commands are available to them?

        @page.fetch!
        @page.title
        @page.links
    end
end

Browser.new.run!
#page = Page.new('http://jarbstudio.com/')