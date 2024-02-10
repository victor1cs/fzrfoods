# frozen_string_literal: true

namespace :dev do
  desc "Creating categorys"
  task create_categorys: :environment do
    puts "Ajustes no BD:"
    puts "Dropando o banco"
    Category.delete_all
    categorys = ["Chicken", "Pork", "Beef", "Other"]
    puts "Criando as categorias -> #{categorys}"

    categorys.each do |category|
      Category.create!(name: category)
    end
    puts "Categorias criadas"
  end
end
