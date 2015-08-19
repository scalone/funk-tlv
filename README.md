# Funk TLV

Extend Hash class with ability to parse and convert BER TLV format. Forked from [hash-ber-tlv gem](https://rubygems.org/gems/hash-ber-tlv).

# Usage

```
# To Ber TLV
{40759=>"u\xCB\x11\xD1"}.to_ber_tlv
=> "\x9F7\x04u\xCB\x11\xD1"

# From Ber TLV
hash.from_ber_tlv("\x9F7\x04u\xCB\x11\xD1")
=> {40759 => "u\xCB\x11\xD1"}

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php
