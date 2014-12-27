#import <Foundation/Foundation.h>

@class JIRIssueFields;

@interface JIRIssue : NSObject <NSCoding> {

    NSString *expand;
    JIRIssueFields *fields;
    NSString *issueId;
    NSString *key;
    NSString *selfURL;

}

@property (nonatomic, copy) NSString *expand;
@property (nonatomic, strong) JIRIssueFields *fields;
@property (nonatomic, copy) NSString *issueId;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *selfURL;

+ (JIRIssue *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
