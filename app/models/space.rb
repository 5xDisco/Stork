class Space < ApplicationRecord
    validates :name, presence: true

    has_many :users_spaces, dependent: :destroy
    has_many :users, through: :users_spaces
    has_many :channels, dependent: :destroy
    
end
