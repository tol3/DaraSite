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

    def tag_list
        tags.map(&:name).join(", ")
    end

    def tag_list=(names)
        self.tags = names.split(",").map do |n|
            ActsAsTaggableOn::Tag.where(name: n.strip).first_or_create!
        end
    end

    def tag_hash
        tags.map {|model| '#'+model.name }.join(" ")
    end

    def getNewsUrl(var)
        case var
            when 1
                return "gossip"
            when 2
                return "hotclip"
            when 3
                return "movie"
            when 4
                return "lakorn"
            when 5
                return "music"
            when 6
                return "socciety"
            when 7
                return "myidol"
            when 8
                return "beauty"
            when 9
                return "lifestyle"
            when 10
                return "travel"
            else
                return "search"
        end
    end

  structure do
    cover   :string
    title   :string
    teaser  :string
    content :text
    post_by :string
    post_date :date
    publish :boolean
    video :boolean
    post_facebook :boolean
    category_id :integer

    timestamps
  end
end