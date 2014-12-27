#import <Foundation/Foundation.h>

@interface JIRIssueFieldsWatches : NSObject <NSCoding> {

    BOOL isWatching;
    NSString *selfUrl;
    NSNumber *watchCount;

}

@property (nonatomic, assign) BOOL isWatching;
@property (nonatomic, copy) NSString *selfUrl;
@property (nonatomic, copy) NSNumber *watchCount;

+ (JIRIssueFieldsWatches *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
