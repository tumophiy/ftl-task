# frozen_string_literal: true

class SharedList < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :viewer, class_name: 'User'
end
