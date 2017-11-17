class User < ApplicationRecord
  has_one :address
  attr_readonly :address
end
