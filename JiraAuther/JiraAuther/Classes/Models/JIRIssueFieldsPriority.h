#import <Foundation/Foundation.h>

@interface JIRIssueFieldsPriority : NSObject <NSCoding> {

    NSString *iconUrl;
    NSString *issueFieldsPriorityId;
    NSString *name;
    NSString *selfUrl;

}

@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *issueFieldsPriorityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;

+ (JIRIssueFieldsPriority *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
