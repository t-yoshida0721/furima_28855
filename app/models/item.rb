class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :product_category
  belongs_to_active_hash :Product_status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  belongs_to :user

  has_one_attached :image


end
