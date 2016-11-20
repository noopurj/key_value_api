class Value < ActiveRecord::Base
  belongs_to :key
  validates :key_id,  uniqueness: { scope: [:time]}
end