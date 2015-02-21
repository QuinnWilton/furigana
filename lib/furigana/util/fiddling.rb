require 'base64'

module Furigana
  module Util
    module Fiddling
      extend self

      def b64d(string)
        Base64.decode64(string)
      end

      def b64e(string)
        Base64.encode64(string).strip
      end

      def bits(data, endianness:)
        if ![:big, :little].include? endianness
          raise ArgumentError, "Expected one of: :big, :little, got #{endianness}"
        end

        result = []
        case data
        when String
          data.each_byte do |data_byte|
            byte = []
            8.times do |i|
              if (data_byte >> i) & 1 == 1
                byte << 1
              else
                byte << 0
              end
            end

            if endianness == :big
              byte = byte.reverse
            end

            result += byte
          end
        when Integer
          while data != 0
            if data & 1 == 1
              result << 1
            else
              result << 0
            end

            data = data >> 1
          end

          while (result.length % 8) != 0
            result << 0
          end

          if endianness == :big
            result = result.reverse
          end
        end

        result
      end

      def unbits(data, endianness:)
        if ![:big, :little].include? endianness
          raise ArgumentError, "Expected one of: :big, :little, got #{endianness}"
        end

        result = ''
        data.each_slice(8) do |byte_array|
          if endianness == :big
            byte_array = byte_array.reverse
          end

          byte = byte_array.map
                           .with_index(0)
                           .map { |n, i| n << i }
                           .inject(:+)

          result << byte.chr
        end

        result
      end

      def bits_str(data, endianness:)
        if ![:big, :little].include? endianness
          raise ArgumentError, "Expected one of: :big, :little, got #{endianness}"
        end

        bits(data, endianness: endianness).join('')
      end

      def bitswap(data)
        result = ''
        data.each_byte do |byte|
          bits    = bits(byte, endianness: :big).reverse
          swapped = unbits(bits, endianness: :big)

          result << swapped
        end

        result
      end

      def bitswap_int(n, width)
        n &= (1 << width) - 1
        s  = bits_str(n, endianness: :little).ljust(width, '0')

        s.to_i(2)
      end

      def enhex(data)
        data.unpack("H*").first
      end

      def unhex(data)
        [data].pack("H*")
      end
    end
  end
end
