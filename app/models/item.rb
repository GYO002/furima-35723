class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :status
  has_one :purchase

  with_options presence: true do
    validates :product_name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :delivery_day_id
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :delivery_day_id
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: '半角¥300~¥9,999,999の間でお願いします'
  validates :price, numericality: { only_integer: true }
end
