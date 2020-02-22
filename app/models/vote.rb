class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :rapper
end
