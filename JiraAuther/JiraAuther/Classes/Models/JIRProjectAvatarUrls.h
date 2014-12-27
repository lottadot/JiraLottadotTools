#import <Foundation/Foundation.h>

@interface JIRProjectAvatarUrls : NSObject <NSCoding> {

    NSString *avatar16x16;
    NSString *avatar24x24;
    NSString *avatar32x32;
    NSString *avatar48x48;

}

@property (nonatomic, copy) NSString *avatar16x16;
@property (nonatomic, copy) NSString *avatar24x24;
@property (nonatomic, copy) NSString *avatar32x32;
@property (nonatomic, copy) NSString *avatar48x48;

+ (JIRProjectAvatarUrls *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
