class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :period
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :image,         presence: true
  validates :name,          presence: true
  validates :explanation,   presence: true
  validates :category_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :period_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :price,         presence: true, numericality: { only_integer: true },
                            numericality: { greater_than: 299, less_than: 10_000_000 }
end
