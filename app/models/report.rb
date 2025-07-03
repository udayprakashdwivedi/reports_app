class Report < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  enum status: { draft: 'draft', published: 'published', archived: 'archived' }
end