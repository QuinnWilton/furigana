require 'attr_extras'

module Furigana
  module Math
    class BitPolynomial
      rattr_initialize :value

      def add(other)
        BitPolynomial.new(self.value ^ other.value)
      end

      def sub(other)
        BitPolynomial.new(self.value ^ other.value)
      end

      def xor(other)
        BitPolynomial.new(self.value ^ other.value)
      end

      def or(other)
        BitPolynomial.new(self.value | other.value)
      end

      def and(other)
        BitPolynomial.new(self.value & other.value)
      end

      def mult(other)
        a = self.value
        b = other.value
        if a > b
          a, b = b, a
        end

        result = 0
        a.bit_length.times do |i|
          if a & (1 << i)
            result ^= b << i
          end
        end

        BitPolynomial.new(result)
      end

      def divmod(other)
        if other.value == 0
          raise ZeroDivisionError
        end

        quotient  = 0
        remainder = self.value
        (self.degree - other.degree).times do |i|
          if remainder & (1 << (i + other.degree))
            remainder ^= other.value << i
            quotient  ^= 1 << i
          end
        end

        return BitPolynomial.new(quotient), BitPolynomial.new(remainder)
      end

      def div(other)
        quotient, _ = self.divmod(other)
        quotient
      end

      def mod(other)
        _, remainder = self.divmod(other)
        return remainder
      end

      def eq(other)
        self.value == other.value
      end

      def lshift(other)
        BitPolynomial.new(self.value << other.value)
      end

      def rshift(other)
        BitPolynomial.new(self.value >> other.value)
      end

      def degree
        [0, self.value.bit_length - 1].max
      end
    end
  end
end
