class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: { message: 'Поле не может быть пустым' }

  before_validation :capitalize_original_and_translated
  before_validation :original_and_translated_register
  before_validation :check_original_and_translated
  before_create :review_date

  private

  def original_and_translated_register
    if original_text.first == ' ' || translated_text.first == ' '
      errors.add(:original_text, 'Пробелов в начале быть не должно') 
    end
  end

  def capitalize_original_and_translated
    original_text.capitalize!
    translated_text.capitalize!
  end

  def check_original_and_translated
    errors.add(:original_text, 'Не может быть таким же как и перевод') if original_text == translated_text
  end

end