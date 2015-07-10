ActiveAdmin.register Image do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


	index as: :grid, columns: 5 do |images|
	  link_to image_tag(images.file.url(:thumb)), admin_image_path(images)
	end

end
