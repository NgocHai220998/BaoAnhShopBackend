class WordExample < ApplicationRecord
  belongs_to :word
  belongs_to :example

  accepts_nested_attributes_for :word, :example
end
