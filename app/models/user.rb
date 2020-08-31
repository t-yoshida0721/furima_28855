class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items 
      
  validates :nickname, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :first_name, presence: true, format: { with: NAME_REGEX  } 
  validates :last_name, presence: true, format: { with: NAME_REGEX } 
  NAME_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/.freeze
  validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX  }
  validates :last_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
  validates :birthday, presence: true
  validates :email, presence: true  
  validates :password, presence: true  
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX


end
