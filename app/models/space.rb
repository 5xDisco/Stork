class Space < ApplicationRecord
    validates :name, presence: true

    has_many :users_spaces
    has_many :users, through: :users_spaces


end
