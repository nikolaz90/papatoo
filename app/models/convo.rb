class Convo < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'

  has_many :messages, dependent: :destroy
  validates :sender_id, uniqueness: { scope: :receiver_id }
  validate :sender_and_user_are_different

  def sender_and_user_are_different
    errors.add(:sender_id, "sender and receiver can't be the same") if sender_id == receiver_id
  end

  scope :between, -> (sender_id, receiver_id) do
    where("(convos.sender_id = ? AND convos.receiver_id = ?)
      OR (convos.receiver_id = ? AND convos.sender_id = ?)",
      sender_id, receiver_id, receiver_id, sender_id)
  end

  def correspondant_has_deleted_account
    User.where(id: receiver_id).empty? || User.where(id: sender_id).empty?
  end
end
