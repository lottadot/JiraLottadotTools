#import <Foundation/Foundation.h>

@class JIRIssueFieldsAggregateprogress;
@class JIRIssueFieldsAssignee;
@class JIRIssueFieldsCreator;
@class JIRIssueFieldsIssuetype;
@class JIRIssueFieldsPriority;
@class JIRIssueFieldsProgress;
@class JIRIssueFieldsProject;
@class JIRIssueFieldsReporter;
@class JIRIssueFieldsStatus;
@class JIRIssueFieldsVotes;
@class JIRIssueFieldsWatches;

@interface JIRIssueFields : NSObject <NSCoding> {

    JIRIssueFieldsAggregateprogress *aggregateprogress;
    JIRIssueFieldsAssignee *assignee;
    NSArray *components;
    NSString *created;
    JIRIssueFieldsCreator *creator;
    NSString *customfield10009;
    NSString *descriptionText;
    NSString *duedate;
    NSArray *fixVersions;
    NSArray *issuelinks;
    JIRIssueFieldsIssuetype *issuetype;
    NSArray *labels;
    NSString *lastViewed;
    JIRIssueFieldsPriority *priority;
    JIRIssueFieldsProgress *progress;
    JIRIssueFieldsProject *project;
    JIRIssueFieldsReporter *reporter;
    NSString *resolution;
    NSString *resolutionDate;
    JIRIssueFieldsStatus *status;
    NSArray *subtasks;
    NSString *timeestimate;
    NSString *timeoriginalestimate;
    NSString *summary;
    NSString *updated;
    NSArray *versions;
    JIRIssueFieldsVotes *votes;
    JIRIssueFieldsWatches *watches;
    NSNumber *workratio;

}

@property (nonatomic, strong) JIRIssueFieldsAggregateprogress *aggregateprogress;
@property (nonatomic, strong) JIRIssueFieldsAssignee *assignee;
@property (nonatomic, copy) NSArray *components;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, strong) JIRIssueFieldsCreator *creator;
@property (nonatomic, copy) NSString *customfield10009;
@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *duedate;
@property (nonatomic, copy) NSArray *fixVersions;
@property (nonatomic, copy) NSArray *issuelinks;
@property (nonatomic, strong) JIRIssueFieldsIssuetype *issuetype;
@property (nonatomic, copy) NSArray *labels;
@property (nonatomic, copy) NSString *lastViewed;
@property (nonatomic, strong) JIRIssueFieldsPriority *priority;
@property (nonatomic, strong) JIRIssueFieldsProgress *progress;
@property (nonatomic, strong) JIRIssueFieldsProject *project;
@property (nonatomic, strong) JIRIssueFieldsReporter *reporter;
@property (nonatomic, copy) NSString *resolution;
@property (nonatomic, copy) NSString *resolutiondate;
@property (nonatomic, strong) JIRIssueFieldsStatus *status;
@property (nonatomic, copy) NSArray *subtasks;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *timeestimate;
@property (nonatomic, copy) NSString *timeoriginalestimate;
@property (nonatomic, copy) NSString *updated;
@property (nonatomic, copy) NSArray *versions;
@property (nonatomic, strong) JIRIssueFieldsVotes *votes;
@property (nonatomic, strong) JIRIssueFieldsWatches *watches;
@property (nonatomic, copy) NSNumber *workratio;

+ (JIRIssueFields *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
