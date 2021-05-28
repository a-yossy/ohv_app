# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Cdモデルの初期データ
Cd.create(format:"1st demo", picture:"1st demo.jpg", title:"1st demo",
          release_date:"2018.10.06", price:500,
          url:"https://outsidehervision.bandcamp.com/releases",
          release_number: 1)
Cd.create(format:"1st EP", picture:"1st EP.jpg", title:"錯綜",
          release_date:"2020.01.24", price:1500,
          url:"https://dot2line.thebase.in/items/26063169",
          release_number: 2)
Cd.create(format:"1st single", picture:"1st single.jpg", title:"秘すれば花",
          release_date:"2020.12.18", price:153,
          url:"https://linkco.re/nxa1Qg4H?lang=ja",
          release_number: 3)

#Songモデルの初期データ
first_demo_cd = Cd.find_by(format: "1st demo")
first_ep_cd = Cd.find_by(format: "1st EP")
first_single_cd = Cd.find_by(format: "1st single")

first_demo_cd.songs.create(name:"Transcend", track_number:1)
first_demo_cd.songs.create(name:"死灰", track_number:2)
first_ep_cd.songs.create(name:"Honesty", track_number:1)
first_ep_cd.songs.create(name:"Thistle", track_number:2)
first_ep_cd.songs.create(name:"Ruhuna(feat. 水咲加奈)", track_number:3)
first_ep_cd.songs.create(name:"Transcend", track_number:4)
first_ep_cd.songs.create(name:"錯綜する片隅", track_number:5)
first_single_cd.songs.create(name:"秘すれば花", track_number:1)

#Liveモデルの初期データ
Live.create(live_date:"2020.2.24 MON", place:"@ANTIKNOCK",
            title:"RiTTLEBOY × Stranded split “flat side” release tour",
            detail:"act/ RiTTLEBOY, Stranded, Hopeless Raven, ikigatari,
                    WITT, makeshift, Catalysts, WEATHERED, kokeshi,
                    from there on, Miles Away",
            open_hour:"13:30", start_hour:"14:00", advance_ticket_price:2200, doors_ticket_price:2700,
            start_time:"2020/02/24")
Live.create(live_date:"2020.8.29 SAT", place:"@福井CHOP",
            title:"PLAY LOUD",
            detail:"act/ totalfeedback, ROLENT, The AshRay",
            open_hour:"18:00", start_hour:"18:30", advance_ticket_price:2000, doors_ticket_price:2500,
            start_time:"2020/08/29")
