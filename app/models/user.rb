class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: {customer: 0, agent: 1}
  has_many :properties, dependent: :destroy
  has_many :favorites
  has_many :messages
  validates :name, presence: true
  validates_uniqueness_of :name
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }

  #validates :role, inclusion: {in: role.keys}
  def favorite?(property)
    favorites.exists?(property_id: property.id)
  end

  def favorite(property)
    favorites.find_by(property_id: property.id)
  end
end
