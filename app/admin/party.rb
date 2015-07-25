ActiveAdmin.register Party do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :poster, :title, :description, :day, :location, :party_type, :content, :party_style, :publish
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


	form do |f|
    f.inputs 'Poster' do
      f.input :poster, :as => :file
    end

    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :day, label: 'party & event date', as: :datetime_picker, :local => true
      f.input :location
      f.input :party_type
    end

    f.inputs 'Content' do
    	f.input :content, :input_html => { :class => "tinymce", :rows => 20, :cols => 120 }
    end

    f.inputs 'party style' do
    	f.input :party_style, :input_html => { :class => "tinymce", :rows => 10, :cols => 120 }
    end

    f.inputs 'Publish' do
      f.input :publish
    end

    para "Press cancel to return to the list without saving."
    actions
  end

  controller do
    def permitted_params
      # params.permit(:blog => [:name, :description])
      params.permit! # allow all parameters
    end
  end

end
