class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :game_scores, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :convos

  validates :username, presence: true, uniqueness: true
  attribute :admin, :boolean, default: false
end
