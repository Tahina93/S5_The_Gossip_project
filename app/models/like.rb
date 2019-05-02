class Like < ApplicationRecord
validates :gossip_id, uniqueness: { scope: :user_id,
    message: "only one like per user per gossip" }

  belongs_to :gossip
  belongs_to :user
end
