ActiveAdmin.register Category do

	menu :priority => 2, :label => "Category"

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :name, :publish
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do
	  column :name, sortable: :name do |p|
    	link_to p.name, admin_category_path(p)
  	end
	  column "Publish", :publish do |p|
      status_tag (p.publish ? "Publish" : "Not Publish"), (p.publish ? :ok : :error)
    end
	  column :updated_at
	  column :created_at
	  actions
	end


end
