class News < ActiveRecord::Base

    belongs_to :category
    validates :cover, :category, :title, :post_by, :post_date, :teaser, :presence => true
    mount_uploader :cover, ImageUploader
    is_impressionable
    acts_as_taggable
    searchkick

    # default_scope { where(:publish => true) }

    scope :publish, -> { where(:publish => true) }
    scope :gossip, -> { where(category_id: 1) }
    scope :hot_clip, -> { where(category_id: 2) }
    scope :movie, -> { where(category_id: 3) }
    scope :lakorn, -> { where(category_id: 4) }
    scope :music, -> { where(category_id: 5) }
    scope :socciety, -> { where(category_id: 6) }
    scope :idol, -> { where(category_id: 7) }
    scope :beauty, -> { where(category_id: 8) }
    scope :life_style, -> { where(category_id: 9) }
    scope :travel, -> { where(category_id: 10) }

  structure do
    cover   :string
    title   :string
    teaser  :string
    content :text
    post_by :string
    post_date :date
    publish :boolean
    category_id :integer

    timestamps
  end
end