ActiveAdmin.register Adsense do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :name, :link, :image, :ads_size, :index, :gossip, :hotclip, :movie, :lakorn, :music, :socciety, :myidol, :beauty, :lifestyle, :travel, :party, :event, :publish

	scope :all, default: true
  scope :Publish do |task| task.where(publish: true) end
  scope :Not_Publish do |task| task.where(publish: false) end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do
		selectable_column
	  column "ID", :id

	  column "Cover", :image do |p|
      if p.image.url == nil
        "No Picture"
      else
        link_to image_tag(p.image.url(:thumb)), admin_adsense_path(p)
      end
    end

		column :ads_size do |p|
			if p.ads_size == 1
				"1500x200"
			elsif p.ads_size == 2
				"450x400"
			elsif p.ads_size == 3
				"200x800"
			elsif p.ads_size == 4
				"450x900"
			end
		end

	  column "Home", :index do |p|
	    status_tag (p.index ? "TRUE" : "FALSE"), (p.index ? :ok : :error)
	  end

	  column "Publish", :publish do |p|
	    status_tag (p.publish ? "Publish" : "Not Publish"), (p.publish ? :ok : :error)
	  end

	  actions
	end

	form do |f|

    f.inputs 'Image', :multipart => true do
      f.input :image, :as => :file, :input_html => { :onchange => "readURL(this);" }, :required => true, :hint => f.object.image.present? \
        ? image_tag(f.object.image.url(:thumb),  :id => "img_prev")
        : image_tag("logo.png", :id => "img_prev")
    end

    f.inputs 'Details' do
      f.input :ads_size, :as => :select, :collection => {"1500x200" => 1, "450x400" => 2, "200x800" => 3, "450x900" => 4 }, :required => true
      f.input :name, :required => true
      f.input :link, :as => :url, :required => true
    end

    f.inputs 'Show On' do
    	f.input :index
			f.input :gossip
    	f.input :hotclip
    	f.input :movie
    	f.input :lakorn
    	f.input :music
    	f.input :socciety
    	f.input :myidol
    	f.input :beauty
    	f.input :lifestyle
    	f.input :travel
    	f.input :party
    	f.input :event
    end

    f.inputs 'Publish' do
      f.input :publish
    end
    para "Press cancel to return to the list without saving."
    actions
  end


end
