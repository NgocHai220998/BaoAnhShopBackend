# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
  word = Word.create(en: Faker::Name.name, vi: Faker::Name.name, spell: Faker::Internet.email, kind: "noun")

  10.times do 
    Example.create(word_id: word.id, en: "Ahihi")
  end
end
