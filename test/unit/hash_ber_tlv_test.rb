
class HashBerTLVTest < DaFunk::Test.case
  def test_to_ber_tlv
    assert_equal "\x9F7\x04u\xCB\x11\xD1", {40759=>"u\xCB\x11\xD1"}.to_ber_tlv
  end

  def test_from_ber_tlv
    hash_tlv = {40759 => "u\xCB\x11\xD1"}
    hash = Hash.new
    assert_equal hash_tlv, hash.from_ber_tlv("\x9F7\x04u\xCB\x11\xD1")
  end
end

