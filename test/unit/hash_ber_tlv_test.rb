
class HashBerTLVTest < DaFunk::Test.case
  def test_to_ber_tlv
    assert_equal "\x9F7\x04u\xCB\x11\xD1", {40759=>"u\xCB\x11\xD1"}.to_ber_tlv
  end

  def test_from_ber_tlv
    hash_tlv = {40759 => "u\xCB\x11\xD1"}
    hash = Hash.new
    assert_equal hash_tlv, hash.from_ber_tlv("\x9F7\x04u\xCB\x11\xD1")
  end

  def test_to_big_ber_tlv
    tlv  = "5F2A02098682021800950580000080009A031707129C01009F02060000000015009F10120014A50003020000000000000000000000FF9F1A0200769F26082568341CC4B3CEBA9F2701809F34034103029F360200519F3303E0F0E89F3704D1F5D3CC9F1E0800000000000000009F1E083541313739363135"
    hash = {24362=>"\t\x86", 130=>"\x18\x00", 149=>"\x80\x00\x00\x80\x00", 154=>"\x17\a\x12", 156=>"\x00", 40706=>"\x00\x00\x00\x00\x15\x00", 40720=>"\x00\x14\xA5\x00\x03\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xFF", 40730=>"\x00v", 40742=>"%h4\x1C\xC4\xB3\xCE\xBA", 40743=>"\x80", 40756=>"A\x03\x02", 40758=>"\x00Q", 40755=>"\xE0\xF0\xE8", 40759=>"\xD1\xF5\xD3\xCC", 40734=>"5A179615"}
    assert_equal hash, Hash.new.from_ber_tlv([tlv].pack("H*"))
  end
end

