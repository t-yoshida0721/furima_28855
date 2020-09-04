class Order < ApplicationRecord
  belongs_to_active_hash :area
  
  - belongs_to :bid
  # belongs_to :item
end
