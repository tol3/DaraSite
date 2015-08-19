ActiveAdmin.register News do

  menu :priority => 3, :label => "News"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :cover, :title, :content, :post_by, :post_date, :publish, :category_id, :tag_list, :video, :post_facebook
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

  member_action :put_wall, method: :get do
    # resource.put_wall!
    # redirect_to admin_news_path, notice: "Facebook has Posted!"
  end

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

    column "Post", :post_facebook do |p|
      status_tag (p.post_facebook ? "Post" : "Unpost"), (p.post_facebook ? :ok : :error)
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
      f.input :post_facebook, :as => :hidden
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
        row("Post") do
          if resource.post_facebook == true
            link_to('Post to Facebook again...', put_wall_admin_news_path)
          else
            link_to('Post to Facebook', put_wall_admin_news_path)
          end
        end
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

    def put_wall
      # raise params.inspect
      news = News.find(params[:id])

      user = FacebookUser.first
      page_graph = Koala::Facebook::API.new(user.page_token)

      link = "http://www.wow2mouth.com/#{news.getNewsUrl(news.category.id)}/#{news.id}"
      article = limit_bytesize(news.teaser, 120) + "... \nอัพเดทข่าวได้ที่ http://www.wow2mouth.com\n" + limit_bytesize(news.tag_hash, 50)
      # raise article.inspect
      page_graph.put_wall_post( article,
        {
          name: news.title,
          link: link,
          caption: "WOW2MOUTH.COM",
          description: news.teaser.first(120),
          picture: "http://www.wow2mouth.com"+news.cover.url(:mini)
        }
      )

      news.post_facebook = true
      news.save

      redirect_to admin_news_path, notice: "Facebook has Posted!"
    end

    def limit_bytesize(str, size)
      str.encoding.name == 'UTF-8' or raise ArgumentError, "str must have UTF-8 encoding"

      # Change to canonical unicode form (compose any decomposed characters).
      # Works only if you're using active_support
      str = str.mb_chars.compose.to_s if str.respond_to?(:mb_chars)

      # Start with a string of the correct byte size, but
      # with a possibly incomplete char at the end.
      new_str = str.byteslice(0, size)

      # We need to force_encoding from utf-8 to utf-8 so ruby will re-validate
      # (idea from halfelf).
      until new_str[-1].force_encoding('utf-8').valid_encoding?
        # remove the invalid char
        new_str = new_str.slice(0..-2)
      end
      new_str
    end
  end


end
