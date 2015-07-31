ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    columns do
      column do
        # panel "View Counter" do
          div class: 'blank_slate_container' do
            h3 'Test visits Chart'
            @impress = Impression.group_by_day(:created_at).count #whatever data you pass to chart
            render partial: 'admin/impression', locals: {impress: @impress}
          end
        # end
      end

      column do
        # panel "View Counter" do
          div class: 'blank_slate_container' do
            h3 'Test visits Chart'
            @impress = Impression.group_by_day(:created_at).count #whatever data you pass to chart
            render partial: 'admin/impression', locals: {impress: @impress}
          end
        # end
      end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent News" do
          ul do
            News.last(5).map do |news|
              li link_to(news.title, admin_news_path(news))
            end
          end
        end
      end

      column do
        panel "Recent Party" do
          ul do
            Party.last(5).map do |news|
              li link_to(news.title, admin_party_path(news))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
