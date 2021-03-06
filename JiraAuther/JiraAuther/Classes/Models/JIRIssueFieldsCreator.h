#import <Foundation/Foundation.h>

@class JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls;

@interface JIRIssueFieldsCreator : NSObject <NSCoding> {

    BOOL active;
    JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls *avatarUrls;
    NSString *displayName;
    NSString *emailAddress;
    NSString *name;
    NSString *selfUrl;

}

@property (nonatomic, assign) BOOL active;
@property (nonatomic, strong) JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls *avatarUrls;
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSString *emailAddress;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;

+ (JIRIssueFieldsCreator *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
