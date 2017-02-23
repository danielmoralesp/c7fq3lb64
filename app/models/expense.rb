class Expense < ActiveRecord::Base
  belongs_to :category

  scope :category_id, -> (category_id) { where category_id: category_id }
  scope :concept, -> (concept) { where("concept like ?", "%#{concept}%")}
end
