class UrlFile < ApplicationRecord
  belongs_to :user

  # Include Active Storage attachments
  has_one_attached :pdf_file



end
