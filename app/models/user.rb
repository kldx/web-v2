class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]

  attr_accessor :login

  has_one :profile, dependent: :destroy
  has_many :articles
  has_many :banners
  has_many :activities
  has_many :items
  has_many :orders
  has_many :comments

  before_create :build_default_profile

  validates :callsign,
    presence: true,
    uniqueness: {
      case_sensitive: false
  }
  validate :validate_callsign

  default_scope -> { order('users.created_at DESC') }

  def validate_callsign
    if User.where(email: callsign).exists?
      errors.add(:callsign, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(callsign) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      if conditions[:callsign].nil?
        where(conditions).first
      else
        where(callsign: conditions[:callsign]).first
      end
    end
  end

  private

    def build_default_profile
      build_profile
      true
    end
end
