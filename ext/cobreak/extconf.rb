require "mkmf"

#Welcome to CoBreak ExtConf

abort "sudo apt install libomp-dev" unless have_library("omp")
if not have_header("openssl/ssl.h") and have_header("nettle/nettle-types.h") and have_library("crypto")
  abort("missing libreries of openssl / nettle / crypto")
end
if (`gem search sqlite3 --installed` == "true")
  #dir of configuration
  dir_config("cobreak")
  if have_header("cobreak_ruby.h")
    have_header("string.h")
    if RUBY_PLATFORM =~ /mswin|darwin/
      have_header("window.h")
    end
    create_header
    create_makefile("cobreak/cobreak")
  else
    abort("missing header's of CoBreak")
  end
else
  abort("missing libreries, use (gem install sqlite3)")
end
