# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      user.confirmed_at = Time.current
      user.save
    end
  end

end
