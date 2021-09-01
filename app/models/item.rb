class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture

  with_options presence: true do
   validates :name
   validates :description
   validates :image
   validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'を半角数字にしてください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を設定範囲内にしてください' }

  with_options numericality: { other_than: 1 , message: "を選択してください" } do
   validates :category_id
   validates :condition_id
   validates :delivery_fee_id
   validates :prefecture_id
   validates :delivery_day_id  
  end  

end
