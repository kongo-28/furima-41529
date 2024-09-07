class OrderForm
  #通常のモデルのようにvalidationなどを使えるようにする
  include ActiveModel::Model 

  # ゲッターとセッターを定義
  attr_accessor :post_code, :prefecture_id, :municipality, 
                :street_address, :building, :phone_number,
                :order, :item, :user

  # バリデーション
  validates :post_code,      presence: true
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality,   presence: true
  validates :street_address, presence: true
  validates :phone_number,   presence: true

  def save
    # 処理
  end
end