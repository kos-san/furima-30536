class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buy_address
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :user
    validates :image, unless: :was_attached?
  end

  # id:1を選択できないようにバリデーションの設定
  validates :category_id, :condition_id, :charge_id, :area_id, :day_id, numericality: { other_than: 1, message: 'Select' }

  # 半角英数でなければ登録できない, 値が300~9,999,999までの範囲で登録する
  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'Out of setting range' }
  validates :price, numericality: { message: 'Half-width number' }

  def was_attached?
    image.attached?
  end
end
