class Space < ApplicationRecord
    validates :name, presence: true

	extend FriendlyId
    friendly_id :friendly_params, use: :slugged

    #和 user 的關聯
    has_many :users_spaces, dependent: :destroy
    has_many :users, through: :users_spaces
    #和 channel 的關聯
    has_many :channels, dependent: :destroy
end
