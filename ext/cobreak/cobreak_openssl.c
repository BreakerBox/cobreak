#include<cobreak_ruby.h>
#include<cobreak_openssl.h>

VALUE mCoBreakOpenSSL;
VALUE cCoBreakOpenSSLmd5;

VALUE md5_hexdigest(VALUE self, VALUE full){
	char *str = RSTRING_PTR(full);
	int n;
	MD5_CTX c;
	unsigned char digest[16];
	char *out = (char*)malloc(33);
	int length = strlen(str);

    MD5_Init(&c);

    while (length > 0) {
        if (length > 512) {
            MD5_Update(&c, str, 512);
        } else {
            MD5_Update(&c, str, length);
        }
        length -= 512;
	str += 512;
    }

    MD5_Final(digest, &c);

    for (n = 0; n < 16; ++n) {
        snprintf(&(out[n*2]), 16*2, "%02x", (unsigned int)digest[n]);
    }

    return rb_str_new2(out);
}


void init_cobreak_openssl(){
#if 0
                mCoBreak = rb_define_module("CoBreak");
#endif
                mCoBreakOpenSSL = rb_define_module_under(mCoBreak, "OpenSSL");
                cCoBreakOpenSSLmd5 = rb_define_class_under(mCoBreakOpenSSL, "MD5", rb_cObject);
                rb_define_singleton_method(cCoBreakOpenSSLmd5, "hexdigest", md5_hexdigest, 1);
}
