class News < ActiveRecord::Base

	belongs_to :category

    validates :cover, :category, :title, :post_by, :post_date, :presence => true

    mount_uploader :cover, ImageUploader

    acts_as_taggable

    is_impressionable

  structure do
    cover   :string
    title   :string
    content :text
    post_by :string
    post_date :date
    publish :boolean
    category_id :integer

    timestamps
  end
end