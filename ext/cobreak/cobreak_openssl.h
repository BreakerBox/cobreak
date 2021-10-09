#ifndef COBREAK_OPENSSL_RUBY
#define COBREAK_OPENSS_RUBY

//include library <cobreak_ruby.h> for project
#include<cobreak_ruby.h>

//definition body for file <header>
//#include<openssl/sha.h>
#include<openssl/md5.h>


//initialize function
char str2md5(const char *str, int length);
void init_cobreak_openssl();

#endif
