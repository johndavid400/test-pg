class Author < ApplicationRecord
  has_many :posts

  enum service: {
    construction_management: 0,
    consulting: 1,
    project_management: 2,
    commercial_and_industrialization: 3,
    mush: 4,
    federal: 5
  }

  def service_options
  end
end
