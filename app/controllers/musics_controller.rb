class MusicsController < ApplicationController
  def index
  end

  def show
    id = params[:id]
    if id == "1"
      @music = {type: "1st single", title: "秘すれば花", date: "2020.12.18",
                song: ["1. 秘すれば花"], price: "¥153(iTunes Store)",
                url: "https://linkco.re/nxa1Qg4H?lang=ja"}
    elsif id == "2"
      @music = {type: "1st EP", title: "錯綜", date: "2020.01.24",
                song: ["1. Honesty", "2. Thistle", "3. Ruhuna(feat. 水咲加奈）",
                       "4. Transcend", "5. 錯綜する片隅"], price: "¥1500",
                url: "https://dot2line.thebase.in/items/26063169"}
    else
      @music = {type: "1st demo", title: "1st demo", date: "2018.10.06",
                song: ["1. Transcend", "2. 死灰"], price: "¥500",
                url: "https://outsidehervision.bandcamp.com/releases"}
    end
    @picture = @music[:type] + ".jpg"
  end
end
