#import "NSString+Digest.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Digest)

- (NSString *)sha1
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString *)md5
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString *)sha512
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];

    CC_SHA512(data.bytes, (CC_LONG)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];

    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }

    return output;
}

- (NSString *)sha512_base64
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(data.bytes, (CC_LONG)data.length, digest);
    NSData *originData = [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
    NSString *encodedStr = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    return encodedStr;
}

- (NSString *)base64Encode
{
    NSData *originData = [self dataUsingEncoding:NSASCIIStringEncoding];
    NSString *encodedStr = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    return encodedStr;
}

- (NSString *)base64Decode
{
    NSData *originData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    NSString *decodedStr = [[NSString alloc] initWithData:originData encoding:NSASCIIStringEncoding];
    
    return decodedStr;
}

- (NSString *)stringByTrim {
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceCharacterSet];
    return [self stringByTrimmingCharactersInSet:characterSet];
}

@end