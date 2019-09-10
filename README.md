# APIManager_KK
## The purpose of this project is to practice the coding skill according to teaching  material from KKBOX. 

> 練習：將 Web Service API 包裝成 SDK 

### Block

**練習目標** 
在屬於 Mobile Internet 的時代裡，我們在寫的手機 App 往往不會是像貪食蛇這樣的單機遊戲，更有可能是透過網路連線，抓取或上傳資料，讓用戶可以提供源源不絕的資訊，並且讓用戶與用戶之間溝通。換言之，手機 App 往往就是一個 Internet Client，KKBOX、甚至 KKBOX 公司內的其他產品線，也是這樣的軟體。

在寫這樣的 App 的時候，我們通常會把整個 App 所有跟網路連線相關的部份集中在一起，比方說，我們把前往某個網路服務所有的網路連線呼叫，都放在同一個 Class 裡頭，不同的 Web API 變成不同的 method，而不是 App 裡頭每個個別的地方發送連線。最後寫出來的程式就會很像我們可以看到的 Facebook SDK 等 Web Service SDK 或是 library。

這麼寫有很多好處：因為所有的連線呼叫都在一起，所以，哪天我們想寫一個 Mac 版本的時候，就可以把這整塊程式搬到 Mac 上，而不用 Mac 版另外再寫一次。我們也可以對整個 library 寫單元測試，知道我們設置的連線方式是否正確，以及 server 是否發生異常。

我們要注意：雖然像 NSString、NSData 都有 initWithContentsOfURL: 這些 method，可以直接傳入網路上的 URL，從網路上抓取資料，但我們應該避免在 GUI app 裡頭使用這些 API，因為這些 API 會卡住 UI。我們建議使用 NSURLSession 或 NSURLConnection 等物件發送非同步的連線；由於 NSURLConnection 在 iOS 9 deprecate，我們特別建議使用 NSURLSession，而且 NSURLSession 的 callback 用的都是本章介紹的 block。

**練習內容** 
httpbin.org 是一個讓人練習 HTTP 連線的沙箱，我們要練習寫一個 httpbin.org 的 Web Service SDK。這個服務有很多 API endpoint，會回傳 JSON、HTML 或圖片格式的資料，我們要使用以下這些 API：

http://httpbin.org/get
http://httpbin.org/post
http://httpbin.org/image/png
包裝成像是以下的 method

- (void)fetchGetResponseWithCallback:(void(^)(NSDictionary *, NSError *))callback;
- (void)postCustomerName:(NSString *)name callback::(void(^)(NSDictionary *, NSError *))callback;
- (void)fetchImageWithCallback:(void(^)(UIImage *, NSError *))callback;

收到的 JSON 資料要轉成 NSDictionary 物件，請查詢 NSJSONSerialization 的文件
收到的 image data 要轉成 UIImage 物件
處理 http://httpbin.org/post 這支 API 的時候，我們只 post custname，像 custname=kkbox

----------------------------------------

### Delegate

**練習內容** 
包裝成像是以下的 method

- (void)fetchGetResponse;
- (void)postCustomerName:(NSString *)name;
- (void)fetchImageWithCallback;

我們的連線物件只有一個單一的 delegate，當這些 method 的連線完成之後，都會將資料透過一個我們設計好的 protocol 傳給 delegate 物件。在呼叫這些 method 的時候，如果發現有任何還在進行中的連線，都要先取消原本的連線，才發送新的連線。

