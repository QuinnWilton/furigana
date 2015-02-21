require 'spec_helper'

describe Furigana::Util::CRC do
  describe 'CRC#generic_crc' do
    let(:data)           { '123456789' }
    let(:polynomial)     { 0x8005 }
    let(:width)          { 16 }
    let(:init)           { 0x0 }
    let(:reflect_input)  { true }
    let(:reflect_output) { true }
    let(:xor_mask)       { 0x0 }
    let(:checksum)       { 47933 }

    it 'computes the checksum' do
      checksum = described_class.generic_crc(
        data,
        polynomial:    polynomial,
        width:         width,
        init:          init,
        reflect_ouput: reflect_output,
        reflect_input: reflect_input,
        xor_mask:      xor_mask
      )

      expect(checksum).to eq(checksum)
    end
  end

  describe 'CRC#find_crc_function' do
    context 'with no matching functions' do
      let(:data)     { '0123456789' }
      let(:checksum) { :not_a_checksum }

      it 'returns no functions' do
        expect(described_class.find_crc_function(data, checksum)).to be_empty
      end
    end

    context 'with matching functions' do
      let(:data)      { '0123456789' }
      let(:checksum)  { 930766865 }
      let(:functions) { [:cksum] }

      it 'returns those functions' do
        expect(described_class.find_crc_function(data, checksum)).to eq(functions)
      end
    end
  end

  describe 'CRC#cksum' do
    let(:data)     { '123456789' }
    let(:checksum) { 930766865 }

    it 'computes the checksum' do
      expect(described_class.cksum(data)).to eq(checksum)
    end
  end

  describe 'CRC#arc' do
    let(:data)     { '123456789' }
    let(:checksum) { 47933 }

    it 'computes the checksum' do
      expect(described_class.arc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_10' do
    let(:data)     { '123456789' }
    let(:checksum) { 409 }

    it 'computes the checksum' do
      expect(described_class.crc_10(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_10_cdma2000' do
    let(:data)     { '123456789' }
    let(:checksum) { 563 }

    it 'computes the checksum' do
      expect(described_class.crc_10_cdma2000(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_11' do
    let(:data)     { '123456789' }
    let(:checksum) { 1443 }

    it 'computes the checksum' do
      expect(described_class.crc_11(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_12_3gpp' do
    let(:data)     { '123456789' }
    let(:checksum) { 1443 }

    it 'computes the checksum' do
      expect(described_class.crc_12_3gpp(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_12_cdma2000' do
    let(:data)     { '123456789' }
    let(:checksum) { 3405 }

    it 'computes the checksum' do
      expect(described_class.crc_12_cdma2000(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_12_dect' do
    let(:data)     { '123456789' }
    let(:checksum) { 3931 }

    it 'computes the checksum' do
      expect(described_class.crc_12_dect(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_13_bbc' do
    let(:data)     { '123456789' }
    let(:checksum) { 1274 }

    it 'computes the checksum' do
      expect(described_class.crc_13_bbc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_14_darc' do
    let(:data)     { '123456789' }
    let(:checksum) { 2093 }

    it 'computes the checksum' do
      expect(described_class.crc_14_darc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_15' do
    let(:data)     { '123456789' }
    let(:checksum) { 1438 }

    it 'computes the checksum' do
      expect(described_class.crc_15(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_15_mpt1327' do
    let(:data)     { '123456789' }
    let(:checksum) { 9574 }

    it 'computes the checksum' do
      expect(described_class.crc_15_mpt1327(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_aug_ccitt' do
    let(:data)     { '123456789' }
    let(:checksum) { 58828 }

    it 'computes the checksum' do
      expect(described_class.crc_16_aug_ccitt(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_buypass' do
    let(:data)     { '123456789' }
    let(:checksum) { 65256 }

    it 'computes the checksum' do
      expect(described_class.crc_16_buypass(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_ccitt_false' do
    let(:data)     { '123456789' }
    let(:checksum) { 10673 }

    it 'computes the checksum' do
      expect(described_class.crc_16_ccitt_false(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_cdma2000' do
    let(:data)     { '123456789' }
    let(:checksum) { 19462 }

    it 'computes the checksum' do
      expect(described_class.crc_16_cdma2000(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_dds_110' do
    let(:data)     { '123456789' }
    let(:checksum) { 40655 }

    it 'computes the checksum' do
      expect(described_class.crc_16_dds_110(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_dect_r' do
    let(:data)     { '123456789' }
    let(:checksum) { 126 }

    it 'computes the checksum' do
      expect(described_class.crc_16_dect_r(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_dect_x' do
    let(:data)     { '123456789' }
    let(:checksum) { 127 }

    it 'computes the checksum' do
      expect(described_class.crc_16_dect_x(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_dnp' do
    let(:data)     { '123456789' }
    let(:checksum) { 60034 }

    it 'computes the checksum' do
      expect(described_class.crc_16_dnp(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_en_13757' do
    let(:data)     { '123456789' }
    let(:checksum) { 49847 }

    it 'computes the checksum' do
      expect(described_class.crc_16_en_13757(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_genibus' do
    let(:data)     { '123456789' }
    let(:checksum) { 54862 }

    it 'computes the checksum' do
      expect(described_class.crc_16_genibus(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_maxim' do
    let(:data)     { '123456789' }
    let(:checksum) { 17602 }

    it 'computes the checksum' do
      expect(described_class.crc_16_maxim(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_mcrf4xx' do
    let(:data)     { '123456789' }
    let(:checksum) { 28561 }

    it 'computes the checksum' do
      expect(described_class.crc_16_mcrf4xx(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_riello' do
    let(:data)     { '123456789' }
    let(:checksum) { 25552 }

    it 'computes the checksum' do
      expect(described_class.crc_16_riello(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_t10_dif' do
    let(:data)     { '123456789' }
    let(:checksum) { 53467 }

    it 'computes the checksum' do
      expect(described_class.crc_16_t10_dif(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_teledisk' do
    let(:data)     { '123456789' }
    let(:checksum) { 4019 }

    it 'computes the checksum' do
      expect(described_class.crc_16_teledisk(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_tms37157' do
    let(:data)     { '123456789' }
    let(:checksum) { 9905 }

    it 'computes the checksum' do
      expect(described_class.crc_16_tms37157(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_16_usb' do
    let(:data)     { '123456789' }
    let(:checksum) { 46280 }

    it 'computes the checksum' do
      expect(described_class.crc_16_usb(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_24' do
    let(:data)     { '123456789' }
    let(:checksum) { 2215682 }

    it 'computes the checksum' do
      expect(described_class.crc_24(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_24_flexray_a' do
    let(:data)     { '123456789' }
    let(:checksum) { 7961021 }

    it 'computes the checksum' do
      expect(described_class.crc_24_flexray_a(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_24_flexray_b' do
    let(:data)     { '123456789' }
    let(:checksum) { 2040760 }

    it 'computes the checksum' do
      expect(described_class.crc_24_flexray_b(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_31_philips' do
    let(:data)     { '123456789' }
    let(:checksum) { 216654956 }

    it 'computes the checksum' do
      expect(described_class.crc_31_philips(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_32' do
    let(:data)     { '123456789' }
    let(:checksum) { 3421780262 }

    it 'computes the checksum' do
      expect(described_class.crc_32(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_32_bzip2' do
    let(:data)     { '123456789' }
    let(:checksum) { 4236843288 }

    it 'computes the checksum' do
      expect(described_class.crc_32_bzip2(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_32_mpeg_2' do
    let(:data)     { '123456789' }
    let(:checksum) { 58124007 }

    it 'computes the checksum' do
      expect(described_class.crc_32_mpeg_2(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_32_posix' do
    let(:data)     { '123456789' }
    let(:checksum) { 1985902208 }

    it 'computes the checksum' do
      expect(described_class.crc_32_posix(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_32c' do
    let(:data)     { '123456789' }
    let(:checksum) { 3808858755 }

    it 'computes the checksum' do
      expect(described_class.crc_32c(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_32d' do
    let(:data)     { '123456789' }
    let(:checksum) { 2268157302 }

    it 'computes the checksum' do
      expect(described_class.crc_32d(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_32q' do
    let(:data)     { '123456789' }
    let(:checksum) { 806403967 }

    it 'computes the checksum' do
      expect(described_class.crc_32q(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_3_rohc' do
    let(:data)     { '123456789' }
    let(:checksum) { 6 }

    it 'computes the checksum' do
      expect(described_class.crc_3_rohc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_40_gsm' do
    let(:data)     { '123456789' }
    let(:checksum) { 910907393606 }

    it 'computes the checksum' do
      expect(described_class.crc_40_gsm(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_4_itu' do
    let(:data)     { '123456789' }
    let(:checksum) { 7 }

    it 'computes the checksum' do
      expect(described_class.crc_4_itu(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_5_epc' do
    let(:data)     { '123456789' }
    let(:checksum) { 0 }

    it 'computes the checksum' do
      expect(described_class.crc_5_epc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_5_itu' do
    let(:data)     { '123456789' }
    let(:checksum) { 7 }

    it 'computes the checksum' do
      expect(described_class.crc_5_itu(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_5_usb' do
    let(:data)     { '123456789' }
    let(:checksum) { 25 }

    it 'computes the checksum' do
      expect(described_class.crc_5_usb(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_64' do
    let(:data)     { '123456789' }
    let(:checksum) { 7800480153909949255 }

    it 'computes the checksum' do
      expect(described_class.crc_64(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_64_we' do
    let(:data)     { '123456789' }
    let(:checksum) { 7128171145767219210 }

    it 'computes the checksum' do
      expect(described_class.crc_64_we(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_64_xz' do
    let(:data)     { '123456789' }
    let(:checksum) { 11051210869376104954 }

    it 'computes the checksum' do
      expect(described_class.crc_64_xz(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_6_cdma2000_a' do
    let(:data)     { '123456789' }
    let(:checksum) { 13 }

    it 'computes the checksum' do
      expect(described_class.crc_6_cdma2000_a(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_6_cdma2000_b' do
    let(:data)     { '123456789' }
    let(:checksum) { 59 }

    it 'computes the checksum' do
      expect(described_class.crc_6_cdma2000_b(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_6_darc' do
    let(:data)     { '123456789' }
    let(:checksum) { 38 }

    it 'computes the checksum' do
      expect(described_class.crc_6_darc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_6_itu' do
    let(:data)     { '123456789' }
    let(:checksum) { 6 }

    it 'computes the checksum' do
      expect(described_class.crc_6_itu(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_7' do
    let(:data)     { '123456789' }
    let(:checksum) { 117 }

    it 'computes the checksum' do
      expect(described_class.crc_7(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_7_rohc' do
    let(:data)     { '123456789' }
    let(:checksum) { 83 }

    it 'computes the checksum' do
      expect(described_class.crc_7_rohc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8' do
    let(:data)     { '123456789' }
    let(:checksum) { 244 }

    it 'computes the checksum' do
      expect(described_class.crc_8(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_82_darc' do
    let(:data)     { '123456789' }
    let(:checksum) { 749237524598872659187218 }

    it 'computes the checksum' do
      expect(described_class.crc_82_darc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_cdma2000' do
    let(:data)     { '123456789' }
    let(:checksum) { 218 }

    it 'computes the checksum' do
      expect(described_class.crc_8_cdma2000(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_darc' do
    let(:data)     { '123456789' }
    let(:checksum) { 21 }

    it 'computes the checksum' do
      expect(described_class.crc_8_darc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_dvb_s2' do
    let(:data)     { '123456789' }
    let(:checksum) { 188 }

    it 'computes the checksum' do
      expect(described_class.crc_8_dvb_s2(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_ebu' do
    let(:data)     { '123456789' }
    let(:checksum) { 151 }

    it 'computes the checksum' do
      expect(described_class.crc_8_ebu(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_i_code' do
    let(:data)     { '123456789' }
    let(:checksum) { 126 }

    it 'computes the checksum' do
      expect(described_class.crc_8_i_code(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_itu' do
    let(:data)     { '123456789' }
    let(:checksum) { 161 }

    it 'computes the checksum' do
      expect(described_class.crc_8_itu(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_maxim' do
    let(:data)     { '123456789' }
    let(:checksum) { 161 }

    it 'computes the checksum' do
      expect(described_class.crc_8_maxim(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_rohc' do
    let(:data)     { '123456789' }
    let(:checksum) { 208 }

    it 'computes the checksum' do
      expect(described_class.crc_8_rohc(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_8_wcdma' do
    let(:data)     { '123456789' }
    let(:checksum) { 37 }

    it 'computes the checksum' do
      expect(described_class.crc_8_wcdma(data)).to eq(checksum)
    end
  end

  describe 'CRC#crc_a' do
    let(:data)     { '123456789' }
    let(:checksum) { 48901 }

    it 'computes the checksum' do
      expect(described_class.crc_a(data)).to eq(checksum)
    end
  end

  describe 'CRC#jamcrc' do
    let(:data)     { '123456789' }
    let(:checksum) { 873187033 }

    it 'computes the checksum' do
      expect(described_class.jamcrc(data)).to eq(checksum)
    end
  end

  describe 'CRC#kermit' do
    let(:data)     { '123456789' }
    let(:checksum) { 8585 }

    it 'computes the checksum' do
      expect(described_class.kermit(data)).to eq(checksum)
    end
  end

  describe 'CRC#modbus' do
    let(:data)     { '123456789' }
    let(:checksum) { 19255 }

    it 'computes the checksum' do
      expect(described_class.modbus(data)).to eq(checksum)
    end
  end

  describe 'CRC#x_25' do
    let(:data)     { '123456789' }
    let(:checksum) { 36974 }

    it 'computes the checksum' do
      expect(described_class.x_25(data)).to eq(checksum)
    end
  end

  describe 'CRC#xfer' do
    let(:data)     { '123456789' }
    let(:checksum) { 3171672888 }

    it 'computes the checksum' do
      expect(described_class.xfer(data)).to eq(checksum)
    end
  end

  describe 'CRC#xmodem' do
    let(:data)     { '123456789' }
    let(:checksum) { 12739 }

    it 'computes the checksum' do
      expect(described_class.xmodem(data)).to eq(checksum)
    end
  end
end
