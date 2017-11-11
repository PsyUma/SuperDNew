class SuperDUpload < ApplicationRecord
  has_attached_file :imgfile, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imgfile, content_type: /\Aimage\/.*\z/
  belongs_to :user
end
