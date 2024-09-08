class OrderForm
  #通常のモデルのようにvalidationなどを使えるようにする
  include ActiveModel::Model 

  # ゲッターとセッターを定義
  attr_accessor :post_code, :prefecture_id, :municipality, 
                :street_address, :building, :phone_number,
                :order_id, :item_id, :user_id, :token

  # バリデーション
  validates :post_code,      presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'xxx-xxxxの形式で入力してください' }
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality,   presence: true
  validates :street_address, presence: true
  validates :phone_number,   presence: true, format: { with: /\A\d{10,11}\z/, message: '10桁か11桁の半角数値で入力してください' }

  def save
    # バリデーション実行
    return false unless valid?

    ActiveRecord::Base.transaction do
      order = Order.new(
        user_id: user_id,
        item_id: item_id
      )
      order.save

      address = Address.new(
        post_code: post_code,
        prefecture_id: prefecture_id, 
        municipality: municipality,
        street_address: street_address, 
        building: building,
        phone_number: phone_number,
        order_id: order.id
      )
      address.save
    end
  end
end