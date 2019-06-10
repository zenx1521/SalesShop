class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shop_items
  has_many :comments
  has_one :bucket 

  before_create :set_balance

  def set_balance
    self.balance = 0
  end 
end
