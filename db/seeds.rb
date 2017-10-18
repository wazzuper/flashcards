# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://1000mostcommonwords.com/1000-most-common-russian-words/'))
table_link = page.css('div#page div#content div#primary div#main article#post-162 table tbody tr td')

num1 = 4
num2 = 5

while num1 < table_link.length
  Card.create(original_text: table_link[num1].text,translated_text: table_link[num2].text, 
              review_date: Date.today + 3.days)
  num1 += 3
  num2 += 3
end
