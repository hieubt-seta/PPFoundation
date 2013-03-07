//
//  NSString+Extension.m
//  PPLibrary,
//  Helper Functions and Classes for Ordinary Application Development on iPhone
//
//  Created by meinside on 09. 10. 11.
//
//  last update: 10.07.21.
//

#import "NSString+Additions.h"

#import "Base64Transcoder.h"
#import "PPLogging.h"


@implementation NSString (NSStringExtension)

#pragma mark -
#pragma mark url encode/decode functions

- (NSString*)urlencodedValue
{
	NSString* urlencodedString = (NSString*)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, CFSTR(":/?#[]@!$&'()*+,;="), kCFStringEncodingUTF8);
	return [urlencodedString autorelease];
}

- (NSString*)urldecodedValue
{
	NSString* urldecodedString = (NSString*)CFURLCreateStringByReplacingPercentEscapes(NULL, (CFStringRef)self, (CFStringRef)@"");
	return [urldecodedString autorelease];
}

#pragma mark -
#pragma mark HMAC-SHA1 digest function

- (NSString*)hmacSha1DigestWithKey:(NSString*)secret
{
	NSData* secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
	NSData* stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
	
	uint8_t digest[CC_SHA1_DIGEST_LENGTH] = {
		0,
	};
	
	CCHmacContext hmacContext;
	CCHmacInit(&hmacContext, kCCHmacAlgSHA1, secretData.bytes, secretData.length);
	CCHmacUpdate(&hmacContext, stringData.bytes, stringData.length);
	CCHmacFinal(&hmacContext, digest);
	
	char base64Encoded[32];
	size_t base64EncodedLength = 32;
	Base64EncodeData(digest, CC_SHA1_DIGEST_LENGTH, base64Encoded, &base64EncodedLength);
	NSData* encodedData = [NSData dataWithBytes:base64Encoded length:base64EncodedLength];
	NSString* base64EncodedString = [[NSString alloc] initWithData:encodedData encoding:NSUTF8StringEncoding];
	
	return [base64EncodedString autorelease];
}

#pragma mark -
#pragma mark MD5 digest function

- (NSString*)md5Digest
{
	const char* cStr = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH] = {
		0,
	};
	CC_MD5(cStr, strlen(cStr), result);
	
	return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]];
}

#pragma mark -
#pragma mark Base64 decoding

- (NSData*)base64DecodedBytes
{
	@try
	{
		size_t base64DecodedLength = EstimateBas64DecodedDataSize([self length]);
		char base64Decoded[base64DecodedLength];
		const char* cStringValue = [self UTF8String];
		if(Base64DecodeData(cStringValue, strlen(cStringValue), base64Decoded, &base64DecodedLength))
		{
			NSData* base64DecodedData = [[NSData alloc] initWithBytes:base64Decoded length:base64DecodedLength];
			return [base64DecodedData autorelease];
		}
	}
	@catch (NSException * e)
	{
		//do nothing
		DebugLog(@"exception: %@", [e reason]);
	}
	return nil;
}

- (BOOL)isValidEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

// complete verification of RFC 2822
- (BOOL) validateEmail: (NSString *) candidate
{
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

+ (NSString *)getUUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}

@end
