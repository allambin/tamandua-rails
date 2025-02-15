class User < ApplicationRecord
  include ActiveModel::Serialization

  has_many :created_tasks
  has_many :assigned_tasks

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
