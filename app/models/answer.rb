class Answer < ApplicationRecord
  has_many :notes, dependent: :destroy
  belongs_to :user
  belongs_to :question
end
