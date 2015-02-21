require 'spec_helper'

describe Furigana::Util::Fiddling do
  describe 'Fiddler#b64d' do
    let(:string)   { 'dGVzdA==' }
    let(:decoding) { 'test' }

    it 'base64 decodes the string' do
      expect(described_class.b64d(string)).to eq(decoding)
    end
  end

  describe 'Fiddler#b64e' do
    let(:string)   { 'test' }
    let(:encoding) { 'dGVzdA==' }

    it 'base64 encodes the string' do
      expect(described_class.b64e(string)).to eq(encoding)
    end
  end

  describe 'Fiddler#bits' do
    context 'given an integer' do
      let(:number) { 511 }

      context 'to be represented as big-endian' do
        let(:endianness) { :big }
        let(:bit_array)  { [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1] }

        it 'is encoded as an array of bits' do
          result = described_class.bits(number, endianness: endianness)
          expect(result).to eq(bit_array)
        end
      end

      context 'to be represented as little-endian' do
        let(:endianness) { :little }
        let(:bit_array)  { [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0] }

        it 'is encoded as an array of bits' do
          result = described_class.bits(number, endianness: endianness)
          expect(result).to eq(bit_array)
        end
      end
    end

    context 'given a string' do
      let(:string) { 'test' }

      context 'to be represented as big-endian' do
        let(:endianness) { :big }
        let(:bit_array)  { [0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0] }

        it 'is encoded as an array of bits' do
          result = described_class.bits(string, endianness: endianness)
          expect(result).to eq(bit_array)
        end
      end

      context 'to be represented as little-endian' do
        let(:endianness) { :little }
        let(:bit_array)  { [0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0] }

        it 'is encoded as an array of bits' do
          result = described_class.bits(string, endianness: endianness)
          expect(result).to eq(bit_array)
        end
      end
    end
  end

  describe 'Fiddler#bits_str' do
    context 'given an integer' do
      let(:number) { 511 }

      context 'to be represented as big-endian' do
        let(:endianness) { :big }
        let(:bit_string) { '0000000111111111' }

        it 'is encoded as an array of bits' do
          result = described_class.bits_str(number, endianness: endianness)
          expect(result).to eq(bit_string)
        end
      end

      context 'to be represented as little-endian' do
        let(:endianness) { :little }
        let(:bit_string) { '1111111110000000' }

        it 'is encoded as an array of bits' do
          result = described_class.bits_str(number, endianness: endianness)
          expect(result).to eq(bit_string)
        end
      end
    end

    context 'given a string' do
      let(:string) { 'test' }

      context 'to be represented as big-endian' do
        let(:endianness) { :big }
        let(:bit_string) { '01110100011001010111001101110100' }

        it 'is encoded as an array of bits' do
          result = described_class.bits_str(string, endianness: endianness)
          expect(result).to eq(bit_string)
        end

        it 'is the inverse of Fiddler#unbits' do
          unbits = described_class.bits(string, endianness: endianness)
          result = described_class.unbits(unbits, endianness: endianness)
          expect(result).to eq(string)
        end
      end

      context 'to be represented as little-endian' do
        let(:endianness) { :little }
        let(:bit_string) { '00101110101001101100111000101110' }

        it 'is encoded as an array of bits' do
          result = described_class.bits_str(string, endianness: endianness)
          expect(result).to eq(bit_string)
        end

        it 'is the inverse of Fiddler#unbits' do
          unbits = described_class.bits(string, endianness: endianness)
          result = described_class.unbits(unbits, endianness: endianness)
          expect(result).to eq(string)
        end
      end
    end
  end

  describe 'Fiddler#unbits' do
    context 'represented as little-endian' do
      let(:data)       { [0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0] }
      let(:endianness) { :little }
      let(:decoded)    { 'hello' }

      it 'decodes the bits to a string' do
        result = described_class.unbits(data, endianness: endianness)
        expect(result).to eq(decoded)
      end

      it 'is the inverse of Fiddler#bits' do
        bits   = described_class.unbits(data, endianness: endianness)
        result = described_class.bits(bits, endianness: endianness)
        expect(result).to eq(data)
      end
    end

    context 'represented as big-endian' do
      let(:data)       { [0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1] }
      let(:endianness) { :big }
      let(:decoded)    { 'hello' }

      it 'decodes the bits to a string' do
        result = described_class.unbits(data, endianness: endianness)
        expect(result).to eq(decoded)
      end

      it 'is the inverse of Fiddler#bits' do
        bits   = described_class.unbits(data, endianness: endianness)
        result = described_class.bits(bits, endianness: endianness)
        expect(result).to eq(data)
      end
    end
  end

  describe 'Fiddler#bitswap' do
    let(:string)  { '4224' }
    let(:swapped) { ',LL,' }

    it 'swaps the bits in every bytes' do
      expect(described_class.bitswap(string)).to eq(swapped)
    end
  end

  describe 'Fiddler#bitswap_int' do
    let(:number)   { 0x1234 }
    let(:width1)   { 8 }
    let(:width2)   { 16 }
    let(:width3)   { 24 }
    let(:width4)   { 32 }
    let(:swapped1) { 44 }
    let(:swapped2) { 11336 }
    let(:swapped3) { 2902016 }
    let(:swapped4) { 742916096 }

    it 'swaps the bits in every bytes' do
      expect(described_class.bitswap_int(number, width1)).to eq(swapped1)
      expect(described_class.bitswap_int(number, width2)).to eq(swapped2)
      expect(described_class.bitswap_int(number, width3)).to eq(swapped3)
      expect(described_class.bitswap_int(number, width4)).to eq(swapped4)
    end
  end

  describe 'Fiddler#enhex' do
    let(:string)  { 'test' }
    let(:encoded) { '74657374' }

    it 'hex encodes the string' do
      expect(described_class.enhex(string)).to eq(encoded)
    end
  end

  describe 'Fiddler#unhex' do
    let(:string)  { '74657374' }
    let(:decoded) { 'test' }

    it 'hex decodes the string' do
      expect(described_class.unhex(string)).to eq(decoded)
    end
  end
end
