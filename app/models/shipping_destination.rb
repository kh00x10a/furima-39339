class ShippingDestination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :purchase_record
  belongs_to_active_hash :prefecture

  
end
