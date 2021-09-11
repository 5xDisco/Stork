class Conversation < ApplicationRecord
  dbelongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
