class Channel < ApplicationRecord
    acts_as_paranoid
    validates :name, presence: true

    has_many :user_channels, dependent: :destroy
    has_many :users, through: :user_channels

    belongs_to :space
    scope :public_channels, -> { where(is_public: true) }
end