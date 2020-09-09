class OrderBid

  include ActiveModel::Model
      
      attr_accessor :postcode, :area_id, :city, :block, :building, :phone_number, :user_id, :item_id, :bid_id, :token
      
      validates :token,presence: true
      validates :postcode, presence: true,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
      validates :city,presence: true
      validates :block,presence: true

      PHONE_NUMBER_REGEX = /\A[0-9]+\z/.freeze
      validates :phone_number, presence: true, length: { maximum:11 },format: { with: PHONE_NUMBER_REGEX }

      def save
        bid = Bid.create(item_id: item_id, user_id: user_id )

        Order.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, bid_id: bid.id)

        
      end
end
