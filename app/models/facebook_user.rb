class FacebookUser < ActiveRecord::Base

	def self.koala(auth)

    fb = Koala::Facebook::API.new(auth.token)

    data = fb.get_object("me")
    user = where(data.slice(:uid)).first_or_initialize.tap do |user|
    	user.uid = data["id"].to_s
    	user.name = data["name"]
    	user.oauth_token = auth.token
    	user.exp = Time.at(auth.expires_at)
    	user.page_token = fb.get_page_access_token("736301666482034")


      user.save!
    end
    # return user
  end

  def facebook
  	@facebook ||= Koala::Facebook::API.new(oauth_token)
  end
  # news = News.find(id)

  # user = FacebookUser.first
  # page_graph = Koala::Facebook::API.new(user.page_token)
  # page_graph.put_wall_post('article',
  # 	{
  # 		name: "name",
  # 		link: "http://www.wow2mouth.com/gossip/146",
  # 		caption: "video",
  # 		description: "description",
  # 		picture: "http://www.wow2mouth.com/uploads/news/cover/146/po.jpg"
  # 	})

  structure do
    uid  :string
    name :string
    email :string
    oauth_token :string
    page_token :string
    exp :datetime

    timestamps
  end
end

