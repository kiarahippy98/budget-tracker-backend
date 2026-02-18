class Transaction < ApplicationRecord
  belongs_to :catergory
  belongs_to :user
end
