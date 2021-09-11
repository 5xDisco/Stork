class Space < ApplicationRecord
    validates :name, presence: true
    #和 user 的關聯
    has_many :users_spaces, dependent: :destroy
    has_many :users, through: :users_spaces
    #和 channel 的關聯
    has_many :channels, dependent: :destroy
    #和 conversation 的關聯
    has_many :conversations, dependent: :destroy
end
