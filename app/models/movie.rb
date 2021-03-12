class Movie < ApplicationRecord
    #searchkick
    belongs_to :user, optional: true
    has_many :reviews

    validates :name, :synopsis, :director, presence: true
    validates :release_year, :rating, numericality: { only_integer: true }
    validates :release_year, presence: true, length: { maximum: 4 }
    validates :rating, presence: true, length: { maximum: 1 }
    
    has_attached_file :image, styles: { medium: "400x600#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
