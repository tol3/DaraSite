class PartyController < ApplicationController
  def index
  	# @test = Category.group_by_day(:created_at).inspect
  	@test = Visit.group_by_day(:started_at).count
  	@test2 = News.group_by_day(:created_at).count
  	@test3 = Visit.all.count
  end

  def show
  end
end


# #<Groupdate::Series:0x007fd304a874b8
# @magic=#<Groupdate::Magic:0x007fd304a78b70
# @field=:day, @options={},
# @time_zone=#<ActiveSupport::TimeZone:0x007fd2ffbd9cf8 @name="UTC", @utc_offset=nil,
# @tzinfo=#<TZInfo::TimezoneProxy: Etc/UTC>,
# @current_period=#<TZInfo::TimezonePeriod: nil,nil,#<TZInfo::TimezoneOffset: 0,0,UTC>>>>, @day_start=0, @time_range=nil, @group_index=0>, @relation=#<ActiveRecord::Relation [#<Category id: 1, name: "Gossip", publish: false, updated_at: "2015-07-25 18:12:57", created_at: "2015-07-09 16:39:28">, #<Category id: 2, name: "Hot Clip", publish: false, updated_at: "2015-07-25 18:13:13", created_at: "2015-07-25 18:13:13">]>>

# {
# 	Thu, 09 Jul 2015 00:00:00 UTC +00:00=>1,
# 	Fri, 10 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Sat, 11 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Sun, 12 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Mon, 13 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Tue, 14 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Wed, 15 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Thu, 16 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Fri, 17 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Sat, 18 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Sun, 19 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Mon, 20 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Tue, 21 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Wed, 22 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Thu, 23 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Fri, 24 Jul 2015 00:00:00 UTC +00:00=>0,
# 	Sat, 25 Jul 2015 00:00:00 UTC +00:00=>9}
