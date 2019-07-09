## Flutter Common

include common Utils and Widgets

### Utils

--- 

#### 1. CommonApp

get app info, like: label, packageName, versionName, versionCode


#### 2. CommonCrypto

- toMd5() : MD5加密
- encodeB64() : Base64编码
- decodeB64() : Base64解码
- aesEncrypt() : AES加密
- aesDecrypt() : AES解密


#### 3. CommonDevice

- model() : 型号
- releaseVersion() : 固件版本
- identifier() : 设备Id


#### 3. CommonFile

- strSize() : 格式化显示文件大小


#### 4. CommonSp
使用shared_preferences进行轻量数据存取

- getInt() : 通过key 获取int 数据
- putInt() : 储存int 数据


#### 5. CommonSystem

- copyToClipboard() : copy文本到剪贴板
- screenWidth() : 获取当前设备屏幕宽度
- screenHeight() : 获取当前设备屏幕高度
- statusBarHeight() : 获取当前设备屏幕状态栏高度


#### 6. CommonTime

- currentMillisecondsTimeStamp() : 获取当前时间的毫秒时间戳
- currentTimeStamp() : 获取当前时间的秒时间戳
- parseDateTimeStr() : 将指定格式字符转换为Date
- dateTimeToStr() : 将Date转换为指定格式字符中
- timeStampToStr() : 将指定时间戳转换为时间字符串
- timeStampToStrWrapped() : 将指定时间戳转换为标准格式字符串
- diffDays() : 计算2个date之间相差的天数


#### 7. CommonColor

- fromStr() : 根据不同字符串生成不同颜色



### Widgets

--- 

#### 1. loading view

![loading view](https://s2.ax1x.com/2019/07/09/ZyrXz4.png)

#### 2. network image view

![loading view](https://s2.ax1x.com/2019/07/09/ZyrzLR.png)

#### 3. file selector

![loading view](https://s2.ax1x.com/2019/07/09/ZyrOWF.png)

#### 4. bottom menu

![loading view](https://s2.ax1x.com/2019/07/09/ZyrLJU.png)

#### 5. bottom modal

![loading view](https://s2.ax1x.com/2019/07/09/ZyrvQJ.png)

#### 6. dialog

![loading view](https://s2.ax1x.com/2019/07/09/Zyrxy9.png)