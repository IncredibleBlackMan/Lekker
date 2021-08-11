class User < ApplicationRecord
  include AASM

  aasm column: 'status' do
    state :active, initial: true
    state :archived

    event :archive, after_commit: :send_status_notification do
      transitions from: :active, to: :archived
    end

    event :unarchive, after_commit: :send_status_notification do
      transitions from: :archived, to: :active
    end
  end

  has_secure_password

  has_many :status_managements

  validates :email,
            presence: true,
            uniqueness: true

  scope :filter_by_status, proc { |status|
    where(status: status) if status.present?
  }

  def send_status_notification
    UserMailer.user_status_notification(self).deliver_now
  end

  private
end
