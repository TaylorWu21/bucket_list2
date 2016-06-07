class Bucket < ActiveRecord::Base
	acts_as_votable
	acts_as_commontable
	
  belongs_to :user
  has_many :lists, dependent: :destroy
  
  has_attached_file :image, styles: { large: "600x600", medium: "300x300#", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.search(search)
		  if search
		  	where("title LIKE ?" , "#{search}")
		 end
	end


	def self.by_title
		order(:title)
	end

	def self.by_description(high = false)
		if high
      order(description: :desc)
    else
      order(:description)
    end
	end 

	def self.by_completed
		order(:completed)
	end 









end
