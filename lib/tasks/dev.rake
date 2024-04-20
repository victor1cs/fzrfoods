# frozen_string_literal: true

namespace :dev do
  desc "Creating test for application"
  task create_objects: :environment do
    puts "Ajustes no BD:"
    puts "Dropando o banco"
    Category.delete_all
    Product.delete_all
    User.delete_all
    categories = ["Chicken", "Pork", "Beef", "Other"]

    puts "Criando as categorias -> #{categories}"

    categories.each do |category|
      Category.create!(name: category)
    end
    puts "Categorias criadas"

    20.times.each do |product|
      name        = Faker::Name.name
      description = Faker::Adjective.positive
      price       = Faker::Number.positive.round(2)
      avatar      = Faker::Avatar.image
      product     = Product.create!(
        name: name,
        description: description,
        price: price,
        avatar: avatar,
        category_id: Category.all.sample.id,
      )
      product.save!
    end

    user = User.create!(email: "teste@tete.com", role: "admin", password: "password")
    user.save
  end
end
