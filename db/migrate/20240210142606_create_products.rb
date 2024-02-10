# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table(:products) do |t|
      t.string(:name)
      t.string(:description)
      t.float(:price)
      t.string(:avatar)
      t.belongs_to(:category, null: true)

      t.timestamps
    end
  end
end
