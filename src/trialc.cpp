#include "testheaders.hpp"
#include <cstring>
#include <string>
using namespace std;

pMather  bls_create()
{
    return new (std::nothrow)BlsSignature();
}
void bls_generate(pMather self)
{
        BlsSignature * p=reinterpret_cast<BlsSignature*>(self);
        p->generate_private_key();
}
EXPORT_C const char* get_public_key(pMather self)
{
    BlsSignature * p=reinterpret_cast<BlsSignature*>(self);
        std::string val=p->get_public_key();
        const char* sk=val.c_str();
        return sk;
}
EXPORT_C const char* get_signature(pMather self)
{
    BlsSignature * p=reinterpret_cast<BlsSignature*>(self);
        std::string val=p->get_signature();
        const char* sg=val.c_str();
        return sg;
}

EXPORT_C const char* get_private_key(pMather self)
{
    BlsSignature * p=reinterpret_cast<BlsSignature*>(self);
        std::string val=p->get_private();
        const char* pk=val.c_str();
        return pk;
}
