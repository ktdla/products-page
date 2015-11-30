
FactoryGirl.define do
  factory :producto, :class => Refinery::Productos::Producto do
    sequence(:nombre) { |n| "refinery#{n}" }
  end
end

