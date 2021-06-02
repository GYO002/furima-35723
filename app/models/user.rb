class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :, presence: true
         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_ruby, presence: true
         validates :first_name_ruby, presence: true
         validates :first_name_ruby, presence: true
end
