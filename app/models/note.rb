class Note < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  scope :agree, -> { where(agreement: true) }

end
