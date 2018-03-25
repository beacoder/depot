class Order < ApplicationRecord

  # [69] update: define pay_type mapping enum
  enum pay_type: {
    "Check"          => 0,
    "Credit card"    => 1,
    "Purchase order" => 2
  }
end
