class PagesController < ApplicationController
  def index
    document = open('https://www.indeed.com/jobs?q=html&l=Chicago%2C+IL')
    content = document.read
    parsed_content = Nokogiri::HTML(content)
    @job_titles = parsed_content.css('.jobtitle')
    render 'index.html.erb'
  end
end
