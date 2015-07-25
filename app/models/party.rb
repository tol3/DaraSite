class Party < ActiveRecord::Base

    mount_uploader :cover, PosterUploader

  structure do
    poster  :string
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

