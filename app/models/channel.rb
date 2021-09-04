class Channel < ApplicationRecord
    acts_as_paranoid
    validates :name, presence: true
end
