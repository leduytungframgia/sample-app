class Comment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user
  
  validates :content, presence: true
end
