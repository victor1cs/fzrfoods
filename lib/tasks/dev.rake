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
    puts "Categorias criadas"
    categories.each do |category|
      Category.create!(name: category)
    end

    puts "Categorias criadas com sucesso!"
    puts "Criando os produtos"
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
    puts "Produtos Criados com sucesso"

    puts "Criando Usuario admin"
    user = User.create!(email: "teste@tete.com", role: "admin", password: "password")
    user.save
    puts "Usuario admin criado com sucesso"
  end
end
