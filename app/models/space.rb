class Space < ApplicationRecord
    validates :name, presence: true

    has_many :space_members
    has_many :user, through: :space_members


end
