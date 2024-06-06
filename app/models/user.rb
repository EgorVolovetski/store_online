class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: { customer: 0, manufacturer: 1 }

  after_initialize :set_default_role, if: :new_record?

  validates :name, :address, :phone, presence: true, on: :create

  validate :manufacturer_email_domain, if: :manufacturer?

  def set_default_role
    self.role ||= :customer
  end

  def customer?
    role == "customer"
  end

  def manufacturer?
    role == "manufacturer"
  end

  private

  def manufacturer_email_domain
    domain = email.split('@').last
    errors.add(:email, 'must be from the domain karazin.ua') unless domain == 'karazin.ua'
  end


end
