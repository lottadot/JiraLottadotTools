#import <Foundation/Foundation.h>

@class JIRIssueFieldsStatusStatusCategory;

@interface JIRIssueFieldsStatus : NSObject <NSCoding> {

    NSString *descriptionText;
    NSString *iconUrl;
    NSString *issueFieldsStatusId;
    NSString *name;
    NSString *selfUrl;
    JIRIssueFieldsStatusStatusCategory *statusCategory;

}

@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *issueFieldsStatusId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;
@property (nonatomic, strong) JIRIssueFieldsStatusStatusCategory *statusCategory;

+ (JIRIssueFieldsStatus *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
