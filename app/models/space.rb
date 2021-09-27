class Space < ApplicationRecord
    validates :name, presence: true
    #和 user 的關聯
    has_many :users_spaces, dependent: :destroy
    has_many :users, through: :users_spaces
    #和 channel 的關聯
    has_many :channels, dependent: :destroy
    has_one_attached :avatar, dependent: :destroy
    validates :avatar, content_type: [:png, :jpg, :jpeg]

    has_many_attached :uploads   
end
