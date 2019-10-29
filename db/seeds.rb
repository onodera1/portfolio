# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(
#  	[
#  		{
#  		:email => '1@1', 
#  		:password => '123456',
#  		:last_name=> 'サンプル',
#  		:first_name=>'1',
#  		:nickname =>'ミッチー',
#  		:phone_number=>'080'
#  		},
#  		{:email => '2@2', 
#  		:password => '123456',
#  		:last_name=> 'サンプル',
#  		:first_name=>'2',
# 		:nickname =>'ナカジーさん',
#  		:phone_number=>'080'
#  		},
#  		{:email => '3@3', 
#  		:password => '123456',
#  		:last_name=> 'サンプル',
#  		:first_name=>'3',
#  		:nickname =>'海さん',
#  		:phone_number=>'080'
#  		}
#  	]
#  )
# Industry.create!(industry_name:'業種サンプル1')


# 5.times.each do |i|
# 	i += 1
# 	Sharing.create!(user_id: 1, title: "タイトル1#{i}",
# 	body: "ボディ#{i}", industry_id: 1 )
# end

# 5.times.each do |b|
# 	b += 1
# 	Sharing.create!(user_id: 2, title: "タイトル2#{b}",
# 	body: "bb#{b}", industry_id: 1 )
# end
# 5.times.each do |c|
# 	c += 1
# 	Sharing.create!(user_id: 3, title: "タイトル3#{c}",
# 	body: "bb#{c}", industry_id: 1 )
# end

# 5.times.each do |i|
# 	i += 1
# 	Counseling.create!(user_id: 1, title: "タイトル1#{i}",
# 	body: "ボディ#{i}", industry_id: 1 )
# end

# 5.times.each do |b|
# 	b += 1
# 	Counseling.create!(user_id: 2, title: "タイトル2#{b}",
# 	body: "bb#{b}", industry_id: 1 )
# end

# 5.times.each do |c|
# 	c += 1
# 	Counseling.create!(user_id: 3, title: "タイトル3#{c}",
# 	body: "bb#{c}", industry_id: 1 )
# end


# Sharing.create!(
#   [
#     {
# 	user_id: 1,
# 	:title => 'ID1の投稿'
# 	:body =>'11'},
# 	{user_id: 2,
# 	:title =>'ID2の投稿'
# 	:body =>'22'
# 	},
# 	{user_id: 3,
# 	:title =>'ID3の投稿'
# 	:body =>'33'
# 	}
#    ]
#  )

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') 
# if Rails.env.development?