class Channel < ApplicationRecord
    acts_as_paranoid
    validates :name, presence: true

    has_many :user_channels
    has_many :users, through: :user_channels
end
