class Message < ApplicationRecord
  belongs_to :convo
  belongs_to :user
end
