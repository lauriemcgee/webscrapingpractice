class PagesController < ApplicationController
  def index
    document = open('https://www.indeed.com/jobs?q=html&l=Chicago%2C+IL')
    content = document.read
    parsed_content = Nokogiri::HTML(content)
    @job_titles = parsed_content.css('.jobtitle').first.class.instance_methods.sort
    render 'index.html.erb'
  end
end
