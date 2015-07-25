class Party < ActiveRecord::Base

    validates :poster, :category, :title, :day, :presence => true

    mount_uploader :cover, PosterUploader

  structure do
    poster  :string
    category  :string
    title   :string
    description :string
    day     :datetime
    location :string
    party_type :string
    content :text
    party_style :text
    publish :boolean

    timestamps
  end
end

