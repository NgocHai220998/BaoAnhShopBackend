class Example < ApplicationRecord
  has_many :word_examples, dependent: :destroy
  has_many :words, through: :word_examples
end
