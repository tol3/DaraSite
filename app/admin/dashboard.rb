ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column span: 2 do
        panel "This Day" do
          div class: 'blank_slate_container' do
            @impress = Impression.where("created_at >= ?", Time.zone.now.beginning_of_day).group_by_hour(:created_at).count #whatever data you pass to chart
            render partial: 'admin/impression', locals: {impress: @impress}
          end
        end
      end

      column span: 3 do
        panel "Last 30 days" do
          div class: 'blank_slate_container' do
            @impress = Impression.where("created_at >= ?", Time.zone.now.beginning_of_month).group_by_day(:created_at).limit(30).count #whatever data you pass to chart
            render partial: 'admin/last', locals: {impress: @impress}
          end
        end
      end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column span: 6 do
        if FacebookUser.all.count > 0
          exp = Time.diff(FacebookUser.first.exp, Time.now , '%y, %M, %w, %d and %h:%m:%s' )
          facebook = FacebookUser.first
          panel "Facebook Plugins <span class='text-r'> #{exp[:diff]} </span>".html_safe do
            # div class: 'blank_slate_container' do
            #   render partial: 'admin/hot', locals: {face: facebook}
            # end
            table_for News.where(post_facebook: nil).publish.reverse_order.limit(10).each do |n|
              n.column("Status") { |task| status_tag (task.post_facebook ? "Posted" : "Unpost"), (task.post_facebook ? :ok : :error) }
              n.column("Title") { |task| link_to task.title, admin_news_path(task) }
              n.column("Created At") { |task| task.created_at? ? l(task.created_at, :format => :long) : '-' }
            end
          end
        else
          panel "Facebook Plugins" do
            div class: 'blank_slate_container' do
              link_to("Login Facebook", "/auth/facebook")
            end
          end
        end

      end

      column span: 3 do
        panel "Recent News" do
          ul do
            News.last(5).map do |news|
              li link_to(news.title, admin_news_path(news))
            end
          end
        end
      end

      column span: 3 do
        panel "Recent Party" do
          ul do
            Party.last(5).map do |news|
              li link_to(news.title, admin_party_path(news))
            end
          end
        end
      end

    end
  end # content
end
