require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
end
describe '商品出品' do
 context '商品出品がうまくいく時' do

    it "全ての項目が存在すれば出品できる" do
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do

    it  "product_nameが空だと登録できない" do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it  " product_descriptionが空だと登録できない" do
      @item.product_description  = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end

    it  "product_category_idが空だと登録できない" do
      @item.product_category_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Product category is not included in the list")
    end

    it  "product_status_idが空だと登録できない" do
      @item.Product_status_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status is not included in the list")
    end

    it  "burden_idが空だと登録できない" do
      @item.burden_id  = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden is not included in the list")
    end

    it  "area_idが空だと登録できない" do
      @item.area_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area is not included in the list")
    end

    it  "days_idが空だと登録できない" do
      @item.days_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Days is not included in the list")
    end

    it  "selling_priseが空だと登録できない" do
      @item.selling_prise = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling prise is not included in the list")
    end

    it  "selling_priseが半角数字でなければ登録できない" do
      @item.selling_prise = "５５５５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling prise is not included in the list")
    end
    
    it  "selling_priseが300以下の場合は登録できない" do
      @item.selling_prise = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling prise is not included in the list")
    end

    it  "selling_priseが10000000000以上の場合は登録できない" do
      @item.selling_prise = "10000000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling prise is not included in the list")
    end
  end
end
end
end