class String
  def to_num
    self.downcase.bytes[0]
  end  
end

class Decoder

  def initialize(str, offset_str)
    @str = str
    @offset_str = offset_str
  end

  def decode
    i = 0
    placeholder = ""
    while i < @str.length
      ascii_number = @str[i].to_num - offset(i)
      if ascii_number < 97
        ascii_number += 26
      end
      placeholder << ascii_number.chr
      i += 1
    end
    puts placeholder.gsub("stop","\n")
  end

  def offset(num)
    num = num % @offset_str.length
    @offset_str[num].to_num - 97  
  end

end

encrpyted_message = "eceueawimetkvpgztloxqbrrghfhywfyriievgzqzmsqtksqyzbsggkccnrkzsuobuhwwadw"\
                    "vfxrghuiisftrdciwgsndiscausejothpsoqvtlbhedxlphlfrswcqxhgzvoihvnjqpsrf"\
                    "ppoksffrfuleyvoprfrnrfultjpthpgjoiwgxyhpxswchrkiohrgkpwesgyvwyaeuaqbvv"\
                    "hngffhskevsvbrlhjfrtjygsyiadusexwguvmjsieqgusphvnzfkghhdbxhvvvvvqnvhsox"\
                    "rcuesrbqpucdiefppgzrrtksdevgmqfrpbuwtjjtglpazbhthgvrtksaclqbmhhphaaskuy"\
                    "hftrdulepwtctsrdxdustjljwurrnecyetpvthyhuiuhzxwqmktkmsiysgsutowbufrdd"\
                    "bexhtlgkvggoqsiynfygrjwkthsoilgcgbwchrkiohrgkcbusvgkhfinuaqdxcbdoido"

puts "Please enter the key"
key = gets.chomp
puts "The key '#{key}' has decoded the message as follows:"
d = Decoder.new(encrpyted_message, key)
d.decode




