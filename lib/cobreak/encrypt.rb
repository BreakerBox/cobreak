require 'openssl'
require 'cobreak/function_db' 
require 'cobreak/function_hash'
require 'cobreak/version'
class Encrypt
  def show(mode, dato)
    encrypt = OpenStruct.new
    encrypt.mode = mode.downcase
    encrypt.dato = dato
    case encrypt.mode
      when ('md4')
        encrypt.crypt = OpenSSL::Digest::MD4.hexdigest(dato)
      when ('md5')
        encrypt.crypt = OpenSSL::Digest::MD5.hexdigest(dato)
      when ('sha1')
        encrypt.crypt = OpenSSL::Digest::SHA1.hexdigest(dato)
      when ('sha224')
        encrypt.crypt = OpenSSL::Digest::SHA224.hexdigest(dato)
      when ('sha256')
        encrypt.crypt = OpenSSL::Digest::SHA256.hexdigest(dato)
      when ('sha384')
        encrypt.crypt = OpenSSL::Digest::SHA384.hexdigest(dato)
      when ('sha512')
        encrypt.crypt = OpenSSL::Digest::SHA512.hexdigest(dato)
      when ('ripemd160')
        encrypt.crypt = OpenSSL::Digest::RIPEMD160.hexdigest(dato)
      else "\e[1;31m[\e[1;37m+\e[1;31m]\e[1;37m Type Hash Not Found"
    end
    unless (encrypt.crypt.nil?)
      puts "\e[1;32m[\e[1;37m+\e[1;32m]\e[1;37m Encrypted Text: #{encrypt.crypt}"
      $datBas::database(encrypt.crypt)
      DB::database(dato, File.join(Gem.path[1], "gems", "cobreak-#{CoBreak.version}", 'lib', 'cobreak', 'show', "#{encrypt.mode}.db"))
    else
      puts "\e[1;31m[\e[1;37m+\e[1;31m]\e[1;37m Not Encrypt Text..."
    end
  end
end
EnCrypt = Encrypt.new
