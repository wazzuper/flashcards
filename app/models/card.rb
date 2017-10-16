class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: { message: 'Поле не может быть пустым' }

  validate :original_and_translated_register, :check_original_and_translated

  before_create :review_date

  private

  def original_and_translated_register
    original_text.strip!
    original_text.capitalize!
    translated_text.strip!
    translated_text.capitalize!
  end

  def check_original_and_translated
    errors.add(:original_text, 'Не может быть таким же как и перевод') if translated_text == original_text
  end

end