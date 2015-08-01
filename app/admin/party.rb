ActiveAdmin.register Party do

  menu :priority => 4, :label => "Party"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :poster,:cover, :title, :description, :day, :location, :party_type, :content, :party_style, :publish, :category, :tag_list
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  scope :all, default: true

  scope :party do |task| task.where(category: "party") end
  scope :event do |task| task.where(category: "event") end

  scope :Publish do |task| task.where(publish: true) end
  scope :Not_Publish do |task| task.where(publish: false) end


  index do
    selectable_column
    column "ID", :id

    column "Poster", :poster do |p|
      if p.poster.url == nil
        "No Picture"
      else
        link_to image_tag(p.poster.url(:thumb)), admin_party_path(p)
      end
    end

    column "Title", :title do |p|
      link_to p.title, admin_party_path(p)
    end

    column "Category", :category

    column "Date", :day

    column "Publish", :publish do |p|
      status_tag (p.publish ? "Publish" : "Not Publish"), (p.publish ? :ok : :error)
    end

    actions
  end


	form do |f|

    f.inputs 'Poster' do
      f.input :poster, :as => :file, :required => true
      f.input :cover, :as => :file, :required => true
    	f.input :category, :as => :select, :collection => {"Party" => "party", "Event" => "event"}, :required => true
    end

    f.inputs 'Details' do
      f.input :title, :required => true
      f.input :description
      f.input :location
      f.input :party_type
      f.input :day, label: 'party & event date', as: :datetime_picker, :local => true, :required => true
    end

    f.inputs 'Content' do
    	f.input :content, :input_html => { :class => "tinymce", :rows => 20, :cols => 120 }
    end

    f.inputs 'Party Style' do
      f.input :party_style, :input_html => { :class => "tinymce", :rows => 10, :cols => 120 }
    end

    f.inputs 'Party Style' do
    	f.input :tag_list, :input_html => { "data-role" => "tagsinput", "class" => "tags" }, :placeholder => "Add Tags", :label => "Tags"
    end

    f.inputs 'Publish' do
      f.input :publish
    end

    para "Press cancel to return to the list without saving."
    actions
  end

  show do |f|
     panel "Party & Event" do
      attributes_table_for resource do
        row("cover") { image_tag(resource.cover.url(:mini)) }
        row("Poster") { image_tag(resource.poster.url(:mini)) }
        row("Category") { resource.category }
        row("Party Type") { resource.party_type }
        row("Location") { resource.location }
        row("Date") { resource.day }
      end
    end

    panel "Details" do
      attributes_table_for resource do
        row("Title") { resource.title }
        row("Description") { resource.description }
        row("Content") { raw resource.content }
        row("Party Style") { raw resource.party_style }
      end
    end

    panel "Other" do
      attributes_table_for resource do
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
