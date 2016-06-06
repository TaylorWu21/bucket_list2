class List < ActiveRecord::Base
  belongs_to :bucket
  acts_as_votable
  has_attached_file :image, styles: { large: "600x600",medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
