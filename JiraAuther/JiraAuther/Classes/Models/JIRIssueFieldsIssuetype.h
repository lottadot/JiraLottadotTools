#import <Foundation/Foundation.h>

@interface JIRIssueFieldsIssuetype : NSObject <NSCoding> {

    NSString *descriptionText;
    NSString *iconUrl;
    NSString *issueFieldsIssuetypeId;
    NSString *name;
    NSString *selfUrl;
    BOOL subtask;

}

@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *issueFieldsIssuetypeId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;
@property (nonatomic, assign) BOOL subtask;

+ (JIRIssueFieldsIssuetype *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
