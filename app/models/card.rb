class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true

  validate :original_and_translated_texts_are_not_the_same

  before_create :review_date

  private

  def original_text=(value)
    write_attribute(:original_text, value) if value
  end

  def translated_text=(value)
    write_attribute(:translated_text, value.to_s.strip.capitalize!) if value
  end

  def original_and_translated_texts_are_not_the_same
    errors.add(:translated_text, 'Не может быть таким же как и перевод') if translated_text == original_text
  end

end