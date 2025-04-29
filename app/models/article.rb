class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :text, presence: true

  def subject
    title
  end 

  def last_comment
    comments.last
  end

  validates_length_of :title, maximum: 140

  validates_length_of :text, maximum: 4000 
end
