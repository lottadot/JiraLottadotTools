#import <Foundation/Foundation.h>

@class JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls;

@interface JIRIssueFieldsProject : NSObject <NSCoding> {

    JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls *avatarUrls;
    NSString *issueFieldsProjectId;
    NSString *key;
    NSString *name;
    NSString *selfUrl;

}

@property (nonatomic, strong) JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls *avatarUrls;
@property (nonatomic, copy) NSString *issueFieldsProjectId;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;

+ (JIRIssueFieldsProject *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
