# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses
  # has_many :shared_lists, foreign_key: 'viewer_id', class_name: 'Shared_list'
  # has_one :shared_lists, foreign_key: 'owner_id', class_name: 'Shared_list'
  has_one :owner, class_name: 'SharedList', foreign_key: 'owner_id'
  has_many :viewers, class_name: 'SharedList', foreign_key: 'viewer_id'
end
