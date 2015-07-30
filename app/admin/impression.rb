ActiveAdmin.register Impression do

	menu :priority => 6, :label => "Statics"

	scope :all, default: true

	scope :today do |task|
		task.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
	end

	scope :week do |task|
		week = Date.today-7.day
		task.where(created_at: week.beginning_of_day..Date.today.end_of_day)
	end

	index do
    selectable_column

    column "id", :sortable => :id do |p|
      link_to p.id, admin_impression_path(p)
    end

    column "View", :view_name do |p|
      if p.view_name
      	link_to p.view_name, admin_impression_path(p)
      end
    end

    column "Type", :impressionable_type
    column "Controller", :controller_name
    column "Actoin", :action_name
    column "IP Address", :ip_address
    column "Created At", :created_at

    actions
  end

end
