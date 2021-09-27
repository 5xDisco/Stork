namespace :demo do

  desc "Initialize Stork demo status"

  task initial: :environment do

    # 建立空間：韓琛幫 和 我是警察
    s1 = Space.create(name: "韓琛幫")
    s2 = Space.create(name: "我是警察")
    
    # 建立 韓琛幫 所屬頻道：

    s1.channels.create([
                        { name: "公開區", is_public: 2 },
                        { name: "龍鼓灘貿易公司", is_public: 1 },
                        { name: "蔡琴同好會", is_public: 1 }
                      ])

    # 建立 我是警察 所屬頻道：  
    s2.channels.create([
                        { name: "公開區", is_public: 2 },
                        { name: "臥底組", is_public: 1 },
                      ])
    
    # 建立腳色：「阿仁」、「琛哥」、「阿明」、「黃sir」、「阿強」

    actor1 = User.create(nickname: "阿仁", email: '111@stork.com', password: 'password', password_confirmation: 'password')  
    actor2 = User.create(nickname: "琛哥", email: '222@stork.com', password: 'password', password_confirmation: 'password')  
    actor3 = User.create(nickname: "阿明", email: '333@stork.com', password: 'password', password_confirmation: 'password')  
    actor4 = User.create(nickname: "黃sir", email: '444@stork.com', password: 'password', password_confirmation: 'password')  
    actor5 = User.create(nickname: "阿強", email: '555@stork.com', password: 'password', password_confirmation: 'password')  

    # 各空間加入腳色
    s1.users = [actor1, actor2, actor3]
    s2.users = [actor1, actor4]

    # 各頻道加入腳色
    s1.channels.find_by(name: "公開區").users = [actor1, actor2, actor3]
    s1.channels.find_by(name: "龍鼓灘貿易公司").users = [actor1, actor2]
    s1.channels.find_by(name: "蔡琴同好會").users = [actor1, actor3]

    s2.channels.find_by(name: "公開區").users = [actor1, actor4]
    s2.channels.find_by(name: "臥底組").users = [actor1, actor4]

    # 龍鼓灘貿易公司 起始訊息
    boss = User.find_by(nickname: "琛哥")
    boss.channels.find_by(name: "龍鼓灘貿易公司").messages.create(user_id: boss.id, content: "阿仁，聽說最近有警察臥底混進組織裡，去打聽一下有什麼風聲")
    
    # 蔡琴同好會 起始訊息
    andy = User.find_by(nickname: "阿明")
    tony = User.find_by(nickname: "阿仁")
    andy.channels.find_by(name: "蔡琴同好會").messages.create(user_id: andy.id, content: "阿仁，最近進一批不錯的音響，要來一起聽蔡琴的黑膠嗎？") 
    tony.channels.find_by(name: "蔡琴同好會").messages.create(user_id: tony.id, content: "OK，但你表情可不可以不要那麼變態")
    
    # 我是警察 起始訊息
    sir = User.find_by(nickname: "黃sir")
    sir.channels.find_by(name: "公開區").messages.create(user_id: sir.id, content: "午餐想吃叉燒包，有人要加一嗎") 
    sir.channels.find_by(name: "臥底組").messages.create(user_id: sir.id, content: "加油啦，再做三年就可以了")
    tony.channels.find_by(name: "臥底組").messages.create(user_id: tony.id, content: "最好是啦") 

  end
end
