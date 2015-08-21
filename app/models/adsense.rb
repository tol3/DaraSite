class Adsense < ActiveRecord::Base


	mount_uploader :image, AdsUploader
	is_impressionable

	scope :publish, -> { where(:publish => true) }

  scope :index, -> { where(index: true) }

  scope :head, -> { where(ads_size: 1) }
  scope :box, -> { where(ads_size: 2) }
  scope :side, -> { where(ads_size: 3) }
  scope :lg, -> { where(ads_size: 4) }

  scope :gossip, -> { where(gossip: true) }
  scope :hotclip, -> { where(hotclip: true) }
  scope :movie, -> { where(movie: true) }
  scope :lakorn, -> { where(lakorn: true) }
  scope :music, -> { where(music: true) }
  scope :socciety, -> { where(socciety: true) }
  scope :idol, -> { where(myidol: true) }
  scope :beauty, -> { where(beauty: true) }
  scope :lifestyle, -> { where(lifestyle: true) }
  scope :travel, -> { where(travel: true) }
  scope :party, -> { where(party: true) }
  scope :event, -> { where(event: true) }

  structure do
    name    :string
    link    :string
    image   :string
    ads_size :integer

    index   :boolean

    gossip	:boolean
		hotclip	:boolean
		movie 	:boolean
		lakorn	:boolean
		music		:boolean
		socciety :boolean
		myidol	:boolean
		beauty	:boolean
		lifestyle	:boolean
		travel	:boolean

		party	:boolean
		event	:boolean

    publish :boolean

    timestamps
  end
end

