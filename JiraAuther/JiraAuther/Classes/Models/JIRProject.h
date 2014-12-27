#import <Foundation/Foundation.h>

@class JIRProjectAvatarUrls;

@interface JIRProject : NSObject <NSCoding> {

    JIRProjectAvatarUrls *avatarUrls;
    NSString *jIRProjectId;
    NSString *key;
    NSString *name;
    NSString *selfUrl;

}

@property (nonatomic, strong) JIRProjectAvatarUrls *avatarUrls;
@property (nonatomic, copy) NSString *jIRProjectId;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;

+ (JIRProject *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
