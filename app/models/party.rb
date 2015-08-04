class Party < ActiveRecord::Base

    validates :poster,:cover, :category, :title, :day, :presence => true
    mount_uploader :poster, PosterUploader
    mount_uploader :cover, ImageUploader
    acts_as_taggable
    is_impressionable
    searchkick

    scope :publish, -> { where(:publish => true) }
    scope :party, -> { where(category: 'party') }
    scope :chill, -> { where(category: 'chill') }
    scope :event, -> { where(category: 'event') }
    scope :prev, -> { where("day < ?", Date.today ) }

    def tag_list
        tags.map(&:name).join(", ")
    end

    def tag_list=(names)
        self.tags = names.split(",").map do |n|
            ActsAsTaggableOn::Tag.where(name: n.strip).first_or_create!
        end
    end

  structure do
    poster  :string
    cover  :string
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

