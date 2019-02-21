# Aliyun::Vms 阿里云语音服务 Ruby Gem aliyun-vms

**适用于阿里云语音服务最新的 *2017-05-25* 版接口**

## 特别说明

目前阿里云通信语音服务提供4个产品，分别是: 

1. 语音验证码
2. 语音通知
3. 语音IVR
4. 智能外呼

**这个 gem 目前只调通的是前面所述的第 2 个语音产品，即“语音通知”。请您在使用 aliyun-vms 前，请参考官方说明文档[阿里云语音业务说明](https://help.aliyun.com/product/54853.html)。**

## 使用前提

使用 aliyun-vms 前，您必须已经是阿里云注册用户，申请开通了“阿里云语音服务”，并且获得了以下几个关键参数: 

1. ACCESS\_KEY\_SECRET: 阿里云用户密钥，在阿里云控制台申请获取。
2. ACCESS\_KEY\_ID:     阿里云用户 ID， 在阿里云控制台申请获取。
3. Tts\_CODE:           语音模版代码，在阿里云申请开通语音服务时申请获取。

## Installation 安装

### Ruby 通用安装方法
在命令行中输入命令（电脑已经安装 gems 命令行工具）

```ruby
gem install aliyun-vms
```

### Rails 应用安装方法

在应用的 Gemfile 文件中添加 Ruby Gems 安装源:

```ruby
gem 'aliyun-vms'   # Ruby Gems 安装源
```

应用的根目录下运行:

```ruby
bundle
```

### 下载后安装

使用 Git 将代码克隆到本地后使用 Rake 命令安装

```bash
git clone https://github.com/kejincan0527/aliyun-vms.git

cd aliyun-vms

rake build

rake install
```

### 安装可能遇到的问题及其解决方式  

安装后，如果在 irb 命令行输入命令

```ruby
require 'aliyun/vms'
```

后，无法正确获取 Gem 引用，或者在 Rails 启动时报错提示如下: 

> ./config/initializers/aliyun-vms.rb:1:in `<top (required)>': uninitialized constant Aliyun::Vms (NameError)

可以改为 Github 安装源，例如 Rails Gemfile 文件引用可以改为下面格式，即可正确安装。

```ruby
gem 'aliyun-vms', '0.0.1', git: 'https://github.com/kejincan0527/aliyun-vms.git'
```

## Usage 使用

### Ruby 程序通用方法（irb命令行示例）

#### 第一步: 

```bash
$ require 'aliyun/vms'
```

```bash
=> true
```

#### 第二步: 

参数设置: 

```ruby
$ Aliyun::Vms.configure do |config|
    config.access_key_secret = ACCESS_KEY_SECRET    # 阿里云接入密钥，在阿里云控制台申请
    config.access_key_id = ACCESS_KEY_ID            # 阿里云接入 ID, 在阿里云控制台申请
    config.action = 'SingleCallByTts'               # 默认设置
    config.format = 'XML'                           # 语音推送返回信息格式，可以填写 'JSON'或者'XML'
    config.region_id = 'cn-hangzhou'                # 默认设置，如果没有特殊需要，可以不改      
    config.signature_method = 'HMAC-SHA1'           # 加密算法，默认设置
    config.signature_version = '1.0'                # 签名版本，默认设置，不用修改
    config.version = '2017-05-25'                   # 服务版本，默认设置，不用修改
  end

```
返回

```ruby
  => "2017-05-25"
```

#### 第三步: 

发送语音: 

    $ Aliyun::Vms.send(called_show_number, called_number, tts_code, tts_param, out_id)

参数说明: 

1. called_show_number: 被叫显示号码，必须为字符型，例如 '057112345678'；
2. called_number: 接收语音的手机号，必须为字符型，例如 '1234567890'；
3. tts\_code:  语音模版代码，必须为字符型，申请开通语音服务后，由阿里云提供，例如 'TTS_12345678'；
4. tts\_param: 请求字符串，向语音模版提供参数，必须是转为字符串的json格式对象，例如 '{"code":"666666", "product":"测试网站" }'；
5. out_id: 外部流水扩展字段，必须为字符型，可以为空。


### Rails 应用使用方法

#### 第一步: 

在 Rails 应用目录 config/initializers/ 下创建脚本文件 aliyun-vms.rb，在文件中加入以下内容: 

config/initializers/aliyun-vms.rb

```ruby
Aliyun::Vms.configure do |config|
  config.access_key_secret = ACCESS_KEY_SECRET    # 阿里云接入密钥，在阿里云控制台申请
  config.access_key_id = ACCESS_KEY_ID            # 阿里云接入 ID, 在阿里云控制台申请
  config.action = 'SingleCallByTts'               # 默认设置
  config.format = 'XML'                           # 语音推送返回信息格式，可以填写 'JSON'或者'XML'
  config.region_id = 'cn-hangzhou'                # 默认设置，如果没有特殊需要，可以不改      
  config.signature_method = 'HMAC-SHA1'           # 加密算法，默认设置
  config.signature_version = '1.0'                # 签名版本，默认设置，不用修改
  config.version = '2017-05-25'                   # 服务版本，默认设置，不用修改
end
```
之后，重新启动 Rails，加载配置。

#### 第二步: 

在 Rails 应用中调用语音发送代码: 

```ruby
Aliyun::Vms.send(called_show_number, called_number, tts_code, tts_param, out_id)
```    

参数说明: 

1. called_show_number: 被叫显示号码，必须为字符型，例如 '057112345678'；
2. called_number: 接收语音的手机号，必须为字符型，例如 '1234567890'；
3. tts\_code:  语音模版代码，必须为字符型，申请开通语音服务后，由阿里云提供，例如 'TTS_12345678'；
4. tts\_param: 请求字符串，向语音模版提供参数，必须是转为字符串的json格式对象，例如 '{"code":"666666", "product":"测试网站" }'；
5. out_id: 外部流水扩展字段，必须为字符型，可以为空。

特别说明: 

在程序中可以先用 HASH 组织 tts\_param 内容，再使用 to_json 方法转换为 json 格式字符串，例如: 

```ruby
...
called_show_number = '057112345678'
called_number = '1234567890'
tts_code = 'TTS_12345678'
tts_param = {"code"=>"666666", "product"=>"测试网站" }.to_json
Aliyun::Vms.send(called_show_number, called_number, tts_code, tts_param)
...
```    

## Development 开发

按照阿里云[官方接口文档](https://help.aliyun.com/document_detail/56190.html)提供的 VMS 样例做了 spect 测试，可以 clone 项目后，在根目录下用命令行运行以下命令测试: 

    $ bundle exec rspec spec


## License 许可

MIT 协议下的开源项目。 [MIT License](http://opensource.org/licenses/MIT).
