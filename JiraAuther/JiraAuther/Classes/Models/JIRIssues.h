#import <Foundation/Foundation.h>

@interface JIRIssues : NSObject <NSCoding> {

    NSString *expand;
    NSArray *issues;
    NSNumber *maxResults;
    NSNumber *startAt;
    NSNumber *total;

}

@property (nonatomic, copy) NSString *expand;
@property (nonatomic, copy) NSArray *issues;
@property (nonatomic, copy) NSNumber *maxResults;
@property (nonatomic, copy) NSNumber *startAt;
@property (nonatomic, copy) NSNumber *total;

+ (JIRIssues *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
