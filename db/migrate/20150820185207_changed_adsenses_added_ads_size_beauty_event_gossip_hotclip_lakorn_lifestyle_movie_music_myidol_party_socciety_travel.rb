class ChangedAdsensesAddedAdsSizeBeautyEventGossipHotclipLakornLifestyleMovieMusicMyidolPartySoccietyTravel < ActiveRecord::Migration
  def self.up
    add_column :adsenses, :ads_size, :integer
    add_column :adsenses, :beauty, :boolean
    add_column :adsenses, :event, :boolean
    add_column :adsenses, :gossip, :boolean
    add_column :adsenses, :hotclip, :boolean
    add_column :adsenses, :lakorn, :boolean
    add_column :adsenses, :lifestyle, :boolean
    add_column :adsenses, :movie, :boolean
    add_column :adsenses, :music, :boolean
    add_column :adsenses, :myidol, :boolean
    add_column :adsenses, :party, :boolean
    add_column :adsenses, :socciety, :boolean
    add_column :adsenses, :travel, :boolean
  end
  
  def self.down
    remove_column :adsenses, :ads_size
    remove_column :adsenses, :beauty
    remove_column :adsenses, :event
    remove_column :adsenses, :gossip
    remove_column :adsenses, :hotclip
    remove_column :adsenses, :lakorn
    remove_column :adsenses, :lifestyle
    remove_column :adsenses, :movie
    remove_column :adsenses, :music
    remove_column :adsenses, :myidol
    remove_column :adsenses, :party
    remove_column :adsenses, :socciety
    remove_column :adsenses, :travel
  end
end
