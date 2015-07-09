class Category < ActiveRecord::Base

	has_many :news

  structure do
    name    :string
    publish :boolean

    timestamps
  end
end

