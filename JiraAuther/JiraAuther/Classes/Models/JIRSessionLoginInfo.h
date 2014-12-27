#import <Foundation/Foundation.h>

@interface JIRSessionLoginInfo : NSObject <NSCoding> {

    NSNumber *failedLoginCount;
    NSString *lastFailedLoginTime;
    NSNumber *loginCount;
    NSString *previousLoginTime;

}

@property (nonatomic, copy) NSNumber *failedLoginCount;
@property (nonatomic, copy) NSString *lastFailedLoginTime;
@property (nonatomic, copy) NSNumber *loginCount;
@property (nonatomic, copy) NSString *previousLoginTime;

+ (JIRSessionLoginInfo *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
