#include <string>
#include <iostream>
#define EXPORT_C extern "C"

typedef void* pMather;
EXPORT_C  pMather  bls_create();
EXPORT_C void bls_generate(pMather self);
EXPORT_C const char* get_private_key(pMather self);
EXPORT_C const char* get_public_key(pMather self);
EXPORT_C const char* get_signature(pMather self);

