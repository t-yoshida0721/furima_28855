require 'rails_helper'

RSpec.describe OrderBid, type: :model do
  describe '#create' do
    before do
      @order_bid = FactoryBot.build(:order_bid)
end

describe '商品購入' do

  context '商品購入がうまくいく時' do

    it "建物以外の項目が存在すれば出品できる" do
      expect(@order_bid).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do

  it "postcodeが空だと登録できない" do
    @order_bid.postcode = ""
    @order_bid.valid?
    expect(@order_bid.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
  end

  it "area_idが空だと登録できない" do
    @order_bid.area_id = "0"
    @order_bid.valid?
    expect(@order_bid.errors.full_messages).to include("Area can't be blank")
  end

  it "cityが空だと登録できない" do
    @order_bid.city= ""
    @order_bid.valid?
    expect(@order_bid.errors.full_messages).to include("City can't be blank")
  end

  it "blockが空だと登録できない" do
    @order_bid.block= ""
    @order_bid.valid?
    expect(@order_bid.errors.full_messages).to include("Block can't be blank")
  end

  it "phone_numberが空だと登録できない" do
    @order_bid.phone_number= ""
    @order_bid.valid?
    expect(@order_bid.errors.full_messages).to include("Phone number can't be blank")
  end

  

  it "電話番号が12桁以上だと登録できない" do
    @order_bid.phone_number= "111111111111"
    @order_bid.valid?
    expect(@order_bid.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end

  it "郵便番号にハイフンがないと登録できない" do
    @order_bid.postcode= "1231234"
    @order_bid.valid?
  
    expect(@order_bid.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
  end
  it "tokenがないと登録できない" do
    @order_bid.token= ""
    @order_bid.valid?
  
    expect(@order_bid.errors.full_messages).to include("Token can't be blank")
  end

  
end
end
end
end