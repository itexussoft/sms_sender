# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if MessageTemplate.count == 0
  File.open("#{Rails.root}/db/wishes.txt", "r") do |wishes|
    while (line = wishes.gets)
      MessageTemplate.create!(msg_type: 'wish', content: "#{line.strip}!")
    end
  end
end
