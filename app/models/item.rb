class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :product_category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  belongs_to :user
  # has_one :order
  has_one :bid

  has_one_attached :image

  validates :image,presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :product_category_id, presence: true, inclusion: { in: 1..10}
  validates :product_status_id, presence: true, inclusion: { in: 1..6}
  validates :burden_id, presence: true, inclusion: { in: 1..2}
  validates :area_id, presence: true, inclusion: { in: 1..47}
  validates :days_id, presence: true, inclusion: { in: 1..3}
  SELLING_PRISE_REGEX = /\A[0-9]+\z/.freeze
  validates :selling_prise, presence: true, inclusion: { in: 300..9999999999},format: { with: SELLING_PRISE_REGEX}


end
