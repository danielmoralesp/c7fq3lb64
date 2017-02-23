class Expense < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  def self.search(user_id, concept, category_id)
    if category_id != 0
      where("user_id = ? AND concept like ? AND category_id = ?", "#{user_id}", "%#{concept}%", "#{category_id}")
    else
      where("user_id = ? AND concept like ? ", "#{user_id}", "%#{concept}%")
    end
  end

  #scope :category_id, -> (category_id) { where category_id: category_id }
  #scope :concept, -> (concept) { where("concept like ?", "%#{concept}%")}
end
