class PurchaseRecordShippingDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number
    

  with_options presence:true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :street_address, format: { with: /\A[\d-]+\z/, message: "は数字とハイフンのみ入力してください" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください" }
  end

  validates :prefecture_id,  numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingDestination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end