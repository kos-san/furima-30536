class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :area_id, :city, :house_num, :building, :tel, :item_id

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_num
    validates :tel
  end

  validates :area_id, numericality: { other_than: 1, message: "Select" }
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
  validates :tel, format: { with: /\A\d{11}\z/, message: 'Input only number' }

  

  def save
    @buy = Buy.create(user_id: user_id, item_id: item_id)
    @address = Address.create(postal_code: postal_code, area_id: area_id, tel: tel, city: city, house_num: house_num, building: building, buy_id: @buy.id)
  end

end