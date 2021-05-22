# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Cdモデルの初期データ
Cd.create(format:"1st demo", picture:"1st demo.jpg", title:"1st demo", release_date:"2018.10.06", price:"¥500", url:"https://outsidehervision.bandcamp.com/releases")
Cd.create(format:"1st EP", picture:"1st EP.jpg", title:"錯綜", release_date:"2020.01.24", price:"¥1500", url:"https://dot2line.thebase.in/items/26063169")
Cd.create(format:"1st single", picture:"1st single.jpg", title:"秘すれば花", release_date:"2020.12.18", price:"¥153(iTunes Store)", url:"https://linkco.re/nxa1Qg4H?lang=ja")

#Songモデルの初期データ
Song.create(name:"Transcend", track_number:1, cd_id:1)
Song.create(name:"死灰", track_number:2, cd_id:1)
Song.create(name:"Honesty", track_number:1, cd_id:2)
Song.create(name:"Thistle", track_number:2, cd_id:2)
Song.create(name:"Ruhuna(feat. 水咲加奈)", track_number:3, cd_id:2)
Song.create(name:"Transcend", track_number:4, cd_id:2)
Song.create(name:"錯綜する片隅", track_number:5, cd_id:2)
Song.create(name:"秘すれば花", track_number:1, cd_id:3)
