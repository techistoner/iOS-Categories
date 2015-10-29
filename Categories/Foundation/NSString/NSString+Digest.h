#import <Foundation/Foundation.h>

@interface NSString (Digest)
@property (readonly) NSString *md5;
@property (readonly) NSString *sha1;
@property (readonly) NSString *sha512;
@property (readonly) NSString *sha512_base64;
@property (readonly) NSString *base64Encode;
@property (readonly) NSString *base64Decode;
@end