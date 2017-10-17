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

# Взял страницу со словами из примера
page = Nokogiri::HTML(open('http://1000mostcommonwords.com/1000-most-common-russian-words/'))
table_link = page.css('div#page div#content div#primary div#main article#post-162 table tbody tr td')

# Создал пустой массив
original_and_translated_texts = []
num1 = 4
num2 = 5

# num1 идет раньше num2, поэтому в сравнении идет он
while num1 < table_link.length
  original_and_translated_texts << [table_link[num1].text, table_link[num2].text]
  num1 +=3
  num2 +=3
end

original_and_translated_texts.each do |original, translated|
  Card.create(original_text: original, translated_text: translated, review_date: Date.today + 3.days)
end