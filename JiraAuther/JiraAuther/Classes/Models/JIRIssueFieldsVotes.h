#import <Foundation/Foundation.h>

@interface JIRIssueFieldsVotes : NSObject <NSCoding> {

    BOOL hasVoted;
    NSString *selfUrl;
    NSNumber *votes;

}

@property (nonatomic, assign) BOOL hasVoted;
@property (nonatomic, copy) NSString *selfUrl;
@property (nonatomic, copy) NSNumber *votes;

+ (JIRIssueFieldsVotes *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
