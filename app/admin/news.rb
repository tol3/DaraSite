ActiveAdmin.register News do

  menu :priority => 3, :label => "News"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :cover, :title, :content, :post_by, :post_date, :publish, :category_id, :tag_list, :video
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  scope :all, default: true
  scope :Publish do |task| task.where(publish: true) end
  scope :Not_Publish do |task| task.where(publish: false) end
  # scope :Other_Product do |task|
  #   task.where('product_type = ?', "Other Product")
  # end

  index do
    selectable_column
    column "ID", :id

    column "Category", :category

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
    f.inputs 'Cover', :multipart => true do
      f.input :cover, :as => :file, :input_html => { :onchange => "readURL(this);" }, :required => true, :hint => f.object.cover.present? \
                                                  ? image_tag(f.object.cover.url(:thumb),  :id => "img_prev")
                                                  : image_tag("image.png", :id => "img_prev")
    end
    f.inputs 'Details' do
      f.input :category_id, :as => :select, :collection => Category.where(publish: true).order(:id), :required => true
      f.input :title, :required => true
      f.input :post_date, label: 'Publish Post At', as: :datepicker, datepicker_options: { min_date: 3.days.ago.to_date, max_date: "+1M" }, :required => true
      f.input :video
    end
    f.inputs 'Content' do
      f.input :teaser, :required => true
      f.input :content, :input_html => { :class => "tinymce", :rows => 40, :cols => 120 }
    end
    f.inputs 'Tags' do
      f.input :tag_list, :input_html => { "data-role" => "tagsinput", "class" => "tags" }, :placeholder => "Add Tags", :label => "Tags"
    end
    f.inputs 'Publish' do
      f.input :post_by, :required => true
      f.input :publish
    end
    para "Press cancel to return to the list without saving."
    actions
  end

  show do
    panel "Details" do
      attributes_table_for resource do
        row("Cover") { image_tag(resource.cover.url(:mini)) }
        row("Category") { resource.category }
        row("Date") { resource.post_date }
      end
    end

    panel "Content" do
      attributes_table_for resource do
        row("title") { resource.title }
        row(" ") { raw resource.content }
        row("Post By") { resource.post_by }
      end
    end

    panel "Other" do
      attributes_table_for resource do
        row("video") { resource.video }
        row("Tag") { resource.tag_list }
        row("Publish") { resource.publish }
        row("Created"){ resource.created_at }
        row("Updated"){ resource.updated_at }
      end
    end
  end

  controller do
    def permitted_params
      # params.permit(:blog => [:name, :description])
      params.permit! # allow all parameters
    end
  end


end
