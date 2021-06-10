class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :delivery
  belongs_to :status

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :area_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true

  #【商品出品バリデーション一覧】
  #カテゴリーのバリデーション（空だと保存できない&「--」を選択すると保存できない）
  validates :category, presence: true
  validates :category_id, numericality: { other_than: 1 }

  #商品の状態（status）のバリデーション（空だと保存できない&「--」を選択すると保存できない）
  validates :status, presence: true
  validates :status_id, numericality: { other_than: 1 }
  
  #配送料の負担（burden）のバリデーション（空だと保存できない&「--」を選択すると保存できない）
  validates :burden, presence: true
  validates :burden_id, numericality: { other_than: 1 }

  #配送先地域（area）のバリデーション（空だと保存できない&「--」を選択すると保存できない）
  validates :area, presence: true
  validates :area_id, numericality: { other_than: 0 }

  #配送日数（derivery）のバリデーション（空だと保存できない&「--」を選択すると保存できない）
  validates :delivery_day_id, presence: true
  validates :delivery_day_id, numericality: { other_than: 1 }

  # 価格の
  validates_inclusion_of :price, in: 300..9999999, message: "半角¥300~¥9,999,999の間でお願いします"
  #with_options presence: true, format: { with: /(/\d/)/, message: '半角¥300~¥9,999,999の間でお願いします' } do
  validates :price, numericality: { only_integer: true }
    #validates :price
  #end

  end
