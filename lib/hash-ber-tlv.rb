class Hash
	def from_ber_tlv(data)
		i = 0
		tag = data[i]
		if tag.unpack('C').pop & 0x1F == 0x1F # matches 00011111 mask? 
			begin
				i += 1
				tag[i] = data[i]
			end while tag[i].unpack('C').pop & 0x80 == 0x80
		end

		length = data[tag.length].unpack('C').pop

		tag_i = tag.unpack('H*').pop.to_i(16)

		if length < 0x80
			self[tag_i] = data[tag.length + 1, length]
			remainder = data[tag.length + 1 + length..-1]
		else
			num_octets = length & 0x7f
			octets = data[tag.length + 1, num_octets].unpack('C*')

			length = 0
  		octets.reverse.each_with_index {|octet, idx|
    		length += octet * (256**idx)
  		}

			self[tag_i] = data[tag.length + 1 + num_octets, length]
			remainder = data[tag.length + 1 + num_octets + length..-1]
		end

		if remainder and remainder.length > 2
			self.from_ber_tlv(remainder)
		end

		self
	end

	def to_ber_tlv
		result = ''
		self.each do |tag, value|
		  v = value.dup
			result << int_to_binstr(tag) # adding tag to result string

			#adding size of the tag
			if v.size < 0x80
				result << int_to_binstr(v.size)
			else
				len_len = int_to_binstr(v.size)
				result << int_to_binstr(0x80 | len_len.size)
				result << len_len
			end

			result << v
		end

		result
	end

	# converts integer to binary string representation
	def int_to_binstr(i)
		binstr = "%X" % i
		binstr = '0' << binstr if binstr.size % 2 == 1
		[binstr].pack('H*')
	end
end

