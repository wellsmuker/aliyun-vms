require 'aliyun/vms'
describe Aliyun::Vms do

  describe "#top test" do
    before do
      Aliyun::Vms.configure do |config|
        config.access_key_secret = 'testSecret'
        config.access_key_id = 'testId'
        config.action = 'SingleCallByTts'
        config.format = 'XML'
        config.region_id = 'cn-hangzhou'
        config.signature_method = 'HMAC-SHA1'
        config.signature_version = '1.0'
        config.version = '2017-05-25'
      end
    end

    it "get the http query url" do
      user_params = {
        'SignatureNonce' => '45e25e9b-0a6f-4070-8c85-2956eda1b466',
        'CalledShowNumber' => '057112345678',
        'CalledNumber' =>	'15300000001',
        'TtsCode' => 'TTS_158490013',
        'TtsParam' => '{"customer":"test"}',
        'Timestamp' => '2017-07-12T02:42:19Z',
        'OutId'	=> '123'
      }
      spect_output = 'http://dyvmsapi.aliyuncs.com/?Signature=zJDF%2BLrzhj%2FThnlvIToysFRq6t4%3D&AccessKeyId=testId&Action=SingleCallByTts&Format=XML&OutId=123&CalledShowNumber=057112345678&CalledNumber=15300000001&RegionId=cn-hangzhou&SignatureMethod=HMAC-SHA1&SignatureNonce=45e25e9b-0a6f-4070-8c85-2956eda1b466&SignatureVersion=1.0&TtsCode=TTS_158490013&TtsParam=%7B%22customer%22%3A%22test%22%7D&Timestamp=2017-07-12T02%3A42%3A19Z&Version=2017-05-25'
      expect(Aliyun::Vms.get_url(user_params)).to eql(spect_output)
    end
  end

  describe "#configure" do
    before do
      Aliyun::Vms.configure do |config|
        config.access_key_secret = 'testSecret'
        config.access_key_id = 'testId'
        config.action = 'SingleCallByTts'
        config.format = 'XML'
        config.region_id = 'cn-hangzhou'
        config.signature_method = 'HMAC-SHA1'
        config.signature_version = '1.0'
        config.version = '2017-05-25'
      end
    end

    it "get query string through configurated itmes" do
      config = Aliyun::Vms.configuration
      method_input = {
        'AccessKeyId' => config.access_key_id,
        'Action' => config.action,
        'Format' => config.format,
        'RegionId' => config.region_id,
        'SignatureMethod' => config.signature_method,
        'SignatureVersion' => config.signature_version,
        'Version' => config.version,
        'SignatureNonce' => '45e25e9b-0a6f-4070-8c85-2956eda1b466',
        'CalledShowNumber' => '057112345678',
        'CalledNumber' =>	'15300000001',
        'TtsCode' => 'TTS_158490013',
        'TtsParam' => '{"customer":"test"}',
        'Timestamp' => '2017-07-12T02:42:19Z',
        'OutId'	=> '123'
      }
      spect_output = 'AccessKeyId=testId&Action=SingleCallByTts&Format=XML&OutId=123&CalledShowNumber=057112345678&CalledNumber=15300000001&RegionId=cn-hangzhou&SignatureMethod=HMAC-SHA1&SignatureNonce=45e25e9b-0a6f-4070-8c85-2956eda1b466&SignatureVersion=1.0&TtsCode=TTS_158490013&TtsParam={"customer":"test"}&Timestamp=2017-07-12T02:42:19Z&Version=2017-05-25'

      expect(Aliyun::Vms.test_query_string(method_input)).to eql(spect_output)
    end
  end

  describe "#params" do
    before do
      Aliyun::Vms.configure do |config|
        config.access_key_secret = 'testSecret'
        config.access_key_id = 'testId'
        config.action = 'SingleCallByTts'
        config.format = 'XML'
        config.region_id = 'cn-hangzhou'
        config.signature_method = 'HMAC-SHA1'
        config.signature_version = '1.0'
        config.version = '2017-05-25'
      end
    end

    it "get query params string by merge configed params and user params" do
      #config = Aliyun::Vms.configuration
      user_params = {
        'SignatureNonce' => '45e25e9b-0a6f-4070-8c85-2956eda1b466',
        'CalledShowNumber' => '057112345678',
        'CalledNumber' =>	'15300000001',
        'TtsCode' => 'TTS_158490013',
        'TtsParam' => '{"customer":"test"}',
        'Timestamp' => '2017-07-12T02:42:19Z',
        'OutId'	=> '123'
      }

      spect_output = 'AccessKeyId=testId&Action=SingleCallByTts&Format=XML&OutId=123&CalledShowNumber=057112345678&CalledNumber=15300000001&RegionId=cn-hangzhou&SignatureMethod=HMAC-SHA1&SignatureNonce=45e25e9b-0a6f-4070-8c85-2956eda1b466&SignatureVersion=1.0&TtsCode=TTS_158490013&TtsParam={"customer":"test"}&Timestamp=2017-07-12T02:42:19Z&Version=2017-05-25'
      get_params = Aliyun::Vms.get_params(user_params)
      expect(Aliyun::Vms.test_query_string(get_params)).to eql(spect_output)
    end
  end

  it "get the canonicalized query string" do
    method_input = {
      'AccessKeyId' => 'testId',
      'Action' => 'SingleCallByTts',
      'Format' => 'XML',
      'RegionId' => 'cn-hangzhou',
      'SignatureMethod' => 'HMAC-SHA1',
      'SignatureVersion' => '1.0',
      'Version' => '2017-05-25',
      'SignatureNonce' => '45e25e9b-0a6f-4070-8c85-2956eda1b466',
      'TtsCode' => 'TTS_158490013',
      'Timestamp' => '2017-07-12T02:42:19Z',
      'CalledShowNumber' => '057112345678',
      'CalledNumber' =>	'15300000001',
      'TtsParam' => '{"customer":"test"}',
      'OutId'	=> '123'
    }

    spect_output = 'AccessKeyId=testId&Action=SingleCallByTts&Format=XML&OutId=123&CalledShowNumber=057112345678&CalledNumber=15300000001&RegionId=cn-hangzhou&SignatureMethod=HMAC-SHA1&SignatureNonce=45e25e9b-0a6f-4070-8c85-2956eda1b466&SignatureVersion=1.0&TtsCode=TTS_158490013&TtsParam=%7B%22customer%22%3A%22test%22%7D&Timestamp=2017-07-12T02%3A42%3A19Z&Version=2017-05-25'

    expect(Aliyun::Vms.canonicalized_query_string(method_input)).to eql(spect_output)
  end

  it "get sign" do
    params_input = {
      'AccessKeyId' => 'testId',
      'Action' => 'SingleCallByTts',
      'Format' => 'XML',
      'RegionId' => 'cn-hangzhou',
      'SignatureMethod' => 'HMAC-SHA1',
      'SignatureVersion' => '1.0',
      'Version' => '2017-05-25',
      'SignatureNonce' => '45e25e9b-0a6f-4070-8c85-2956eda1b466',
      'CalledShowNumber' => '057112345678',
      'CalledNumber' =>	'15300000001',
      'TtsCode' => 'TTS_158490013',
      'TtsParam' => '{"customer":"test"}',
      'Timestamp' => '2017-07-12T02:42:19Z',
      'OutId'	=> '123'
    }
    key = 'testSecret'
    spect_output = 'zJDF%2BLrzhj%2FThnlvIToysFRq6t4%3D'
    coded_params = 'AccessKeyId=testId&Action=SingleCallByTts&Format=XML&OutId=123&CalledShowNumber=057112345678&CalledNumber=15300000001&RegionId=cn-hangzhou&SignatureMethod=HMAC-SHA1&SignatureNonce=45e25e9b-0a6f-4070-8c85-2956eda1b466&SignatureVersion=1.0&TtsCode=TTS_158490013&TtsParam=%7B%22customer%22%3A%22test%22%7D&Timestamp=2017-07-12T02%3A42%3A19Z&Version=2017-05-25'

    expect(Aliyun::Vms.sign(key, coded_params)).to eql(spect_output)
  end

end
