class Word < ApplicationRecord
  has_many :word_examples, dependent: :destroy
  has_many :examples, through: :word_examples

  validates :voca, presence: true
  validates :vi, presence: true
  validates :spell, presence: true

  enum kind: {"Noun" => 0, "Verb" => 1, "Noun-Verb" => 2, "Noun-Adjective-na" => 3, "Noun-Adjective-i" => 4,
              "Adverb" => 5, "Adjective" => 6, "Adjective-i" => 7,
              "Adjective-na" => 8, "Preposition" => 9, "Verb-1" => 10, "Verb-2" => 11, "Verb-3" => 12, "Other" => 13}
  enum level: {"N1" => 0, "N2" => 1, "N3" => 2, "N4" => 3, "N5" => 4}
end
