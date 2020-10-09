class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true
  # validates :user 後から確認
  validates :category,    presence: true
  validates :condition,   presence: true
  validates :charge,      presence: true
  validates :area,        presence: true
  validates :day,         presence: true

  # id:1を選択できないようにバリデーションの設定
  validates :category_id, :condition_id, :charge_id, :area_id, :day_id, numericality: { other_than: 1 }

  # 半角英数でなければ登録できない, 金額が300~9,999,999までの範囲で登録する
  validates :price, format: { with: /\A\d{3}\z/, message: 'Price Half-width number' }, numericality: {greater_than: 299,less_than: 10000000, message: 'Price Out of setting range'}


  
end


