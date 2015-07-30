ActiveAdmin.register Image do

	menu :priority => 5, :label => "Assets"

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

	show do |f|
		panel "Detail" do
      attributes_table_for resource do
        row("id") { resource.id }
        row("image") { image_tag(resource.file.url(:thumb)) }
        row("alt & hint") { "alt : #{resource.alt} | hint : #{resource.hint}" }

        row("file name") { resource.file_file_name }
        row("file size") { "#{(resource.file_file_size/1024)} KB" }
        row("Created"){ resource.created_at }
        row("Updated"){ resource.updated_at }
      end
    end
	end

end
