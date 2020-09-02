FactoryBot.define do
  factory :item do
    
    association :user
    product_name            {"abe"}
    product_description     {"あああ"}
    product_category_id     {"1"}
    Product_status_id       {"1"}
    burden_id               {"1"} 
    area_id                 {"1"}
    days_id                 {"1"}
    selling_prise           {"300"}
  end
end
