class Message < ApplicationRecord
  belongs_to :item
  belongs_to :user 
  validates :text,presence: { message: 'は１文字以上入力してください。' }
end
