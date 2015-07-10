ActiveAdmin.register News do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :cover, :title, :content, :post_by, :post_date, :publish, :category_id
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

    column "Cover", :cover do |p|
      if p.cover.url == nil
        "No Picture"
      else
        link_to image_tag(p.cover.url(:thumb)), admin_news_path(p)
      end
    end

    column "Title", :title do |p|
      link_to p.title, admin_news_path(p)
    end

    column "Post By", :post_by

    column "Publish", :publish do |p|
      status_tag (p.publish ? "Publish" : "Not Publish"), (p.publish ? :ok : :error)
    end

    actions
  end

	form do |f|
    f.inputs 'Cover' do
      f.input :cover, :as => :file
    end
    f.inputs 'Details' do
      f.input :category
      f.input :title
      f.input :post_date, label: 'Publish Post At', as: :datepicker, datepicker_options: { min_date: 3.days.ago.to_date, max_date: "+1M" }
    end
    f.inputs 'Content' do
    	f.input :content, :input_html => { :class => "tinymce", :rows => 40, :cols => 120 }
    end
    f.inputs 'Publish' do
      f.input :post_by
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
