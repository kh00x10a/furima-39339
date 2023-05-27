class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_responsibility
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :name, :explanation, :image, presence: true

  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: "は半角数字のみ使用してください。" }

  validates :category_id, :condition_id, :shipping_fee_responsibility_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
end
