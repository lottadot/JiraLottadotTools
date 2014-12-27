#import <Foundation/Foundation.h>

@class JIRSessionLoginInfo;

@interface JIRSession : NSObject <NSCoding> {

    JIRSessionLoginInfo *loginInfo;
    NSString *name;
    NSString *selfUrl;

}

@property (nonatomic, strong) JIRSessionLoginInfo *loginInfo;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;

+ (JIRSession *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
