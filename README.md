**Stork**
===

- Demo 網址: http://storkapp.tw/  

- Stork 網站網頁示意圖
![Stork-cover-f](https://user-images.githubusercontent.com/15827441/135775580-29d2f6af-a84e-4385-b4cd-55d0e7122911.png)


---

## **主要功能**

**1. 打造自己的聊天空間**
  - 簡易建立/便於編輯
  - 細膩溝通更多頻道
  - 查看未來行程


**2. 即時的通訊互動**
  - 群組聊天與私訊
  - 公開 / 私人頻道
  - 上傳圖片與連結


**3. Google行事曆功能**
  - 串接 Google 行事曆
  - 即時建立事件
  - 查看未來行程



## **專案初始化**

### **專案使用版本**
- Ruby 2.7.3
- Rails 6.1.4
- PostgreSQL

### **Install Project**
1. Fork **Stork** Repository
2. bundle 安裝相關後端套件
3. yarn  安裝相關前端套件
4. Migration 資料庫遷移
5. 安裝 [ImageMagick](https://imagemagick.org/script/download.php)
6. foreman 啟動專案

```console
 $ bundle install
 $ yarn install
 $ rails db:migrate
 $ foreman start
```


## **使用技術**
- **前端：** Tailwindcss /  Webpack / Stimulus JS / jQuery
- **後端：** Ruby on Rails
- **部署：** Heroku, AWS S3
- **第三方串接:** Google Calendar API / Google OAuth 2.0 



## **開發團隊**

- **陳曜東**
  >+ 主要負責： Action Cable、分群聊天、在線狀態、對話串功能、網頁切版
  >+ Email: cyd2258@gmail.com
  >+ GitHub ID:Jimmy-Chen-2B

- **林琪芮**
  >+ 主要負責：網站部署、頻道功能、邀請成員、串接 Google 行事曆、網頁切版
  >+ Email: cclok922@gmail.com
  >+ GitHub ID:linchiquei

- **李徽典**
  >+ 主要負責：Action Mailer、空間功能、簡報設計、網頁切版
  >+ Email: nh@g-mail.nsysu.edu.tw
  >+ GitHub ID: KtKeaton

- **王亭樺**
  >+ 主要負責：會員系統、第三方登入、簡報設計、網頁切版
  >+ Email: 4000p049@gmail.com
  >+ GitHub ID:Doreme2021

- **王安祺**
  >+ 主要負責：Action Text、圖片上傳、AWS S3、簡報設計、網頁切版
  >+ Email: contrary.ak@gmail.com
  >+ Github ID: An-Chi
