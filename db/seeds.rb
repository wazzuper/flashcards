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
cells = page.css('div#page div#content div#primary div#main article#post-162 table tbody tr')

cells.delete(cells.first)

cells.each do |line|
  Card.create(original_text: line.css('td')[1].text,
              translated_text: line.css('td')[2].text,
              review_date: Date.today + 3.days)
end