# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category, optional: true
end
