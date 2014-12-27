#import "JIRIssueFields.h"

#import "JIRIssueFieldsAggregateprogress.h"
#import "JIRIssueFieldsAssignee.h"
#import "JIRIssueFieldsCreator.h"
#import "JIRIssueFieldsIssuetype.h"
#import "JIRIssueFieldsPriority.h"
#import "JIRIssueFieldsProgress.h"
#import "JIRIssueFieldsProject.h"
#import "JIRIssueFieldsReporter.h"
#import "JIRIssueFieldsStatus.h"
#import "JIRIssueFieldsVotes.h"
#import "JIRIssueFieldsWatches.h"

@implementation JIRIssueFields

@synthesize aggregateprogress;
@synthesize assignee;
@synthesize components;
@synthesize created;
@synthesize creator;
@synthesize customfield10009;
@synthesize descriptionText;
@synthesize duedate;
@synthesize fixVersions;
@synthesize issuelinks;
@synthesize issuetype;
@synthesize labels;
@synthesize lastViewed;
@synthesize priority;
@synthesize progress;
@synthesize project;
@synthesize reporter;
@synthesize resolution;
@synthesize resolutiondate;
@synthesize status;
@synthesize timeestimate;
@synthesize timeoriginalestimate;
@synthesize subtasks;
@synthesize summary;
@synthesize updated;
@synthesize versions;
@synthesize votes;
@synthesize watches;
@synthesize workratio;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.aggregateprogress forKey:@"aggregateprogress"];
    [encoder encodeObject:self.assignee forKey:@"assignee"];
    [encoder encodeObject:self.components forKey:@"components"];
    [encoder encodeObject:self.created forKey:@"created"];
    [encoder encodeObject:self.creator forKey:@"creator"];
    [encoder encodeObject:self.customfield10009 forKey:@"customfield10009"];
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.duedate forKey:@"duedate"];
    [encoder encodeObject:self.fixVersions forKey:@"fixVersions"];
    [encoder encodeObject:self.issuelinks forKey:@"issuelinks"];
    [encoder encodeObject:self.issuetype forKey:@"issuetype"];
    [encoder encodeObject:self.labels forKey:@"labels"];
    [encoder encodeObject:self.lastViewed forKey:@"lastViewed"];
    [encoder encodeObject:self.priority forKey:@"priority"];
    [encoder encodeObject:self.progress forKey:@"progress"];
    [encoder encodeObject:self.project forKey:@"project"];
    [encoder encodeObject:self.reporter forKey:@"reporter"];
    [encoder encodeObject:self.resolution forKey:@"resolution"];
    [encoder encodeObject:self.resolutiondate forKey:@"resolutiondate"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeObject:self.subtasks forKey:@"subtasks"];
    [encoder encodeObject:self.timeestimate forKey:@"timeestimate"];
    [encoder encodeObject:self.timeoriginalestimate forKey:@"timeoriginalestimate"];
    [encoder encodeObject:self.summary forKey:@"summary"];
    [encoder encodeObject:self.updated forKey:@"updated"];
    [encoder encodeObject:self.versions forKey:@"versions"];
    [encoder encodeObject:self.votes forKey:@"votes"];
    [encoder encodeObject:self.watches forKey:@"watches"];
    [encoder encodeObject:self.workratio forKey:@"workratio"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.aggregateprogress = [decoder decodeObjectForKey:@"aggregateprogress"];
        self.assignee = [decoder decodeObjectForKey:@"assignee"];
        self.components = [decoder decodeObjectForKey:@"components"];
        self.created = [decoder decodeObjectForKey:@"created"];
        self.creator = [decoder decodeObjectForKey:@"creator"];
        self.customfield10009 = [decoder decodeObjectForKey:@"customfield10009"];
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.duedate = [decoder decodeObjectForKey:@"duedate"];
        self.fixVersions = [decoder decodeObjectForKey:@"fixVersions"];
        self.issuelinks = [decoder decodeObjectForKey:@"issuelinks"];
        self.issuetype = [decoder decodeObjectForKey:@"issuetype"];
        self.labels = [decoder decodeObjectForKey:@"labels"];
        self.lastViewed = [decoder decodeObjectForKey:@"lastViewed"];
        self.priority = [decoder decodeObjectForKey:@"priority"];
        self.progress = [decoder decodeObjectForKey:@"progress"];
        self.project = [decoder decodeObjectForKey:@"project"];
        self.reporter = [decoder decodeObjectForKey:@"reporter"];
        self.resolution = [decoder decodeObjectForKey:@"resolution"];
        self.resolutiondate = [decoder decodeObjectForKey:@"resolutiondate"];
        self.status = [decoder decodeObjectForKey:@"status"];
        self.subtasks = [decoder decodeObjectForKey:@"subtasks"];
        self.timeestimate = [decoder decodeObjectForKey:@"timeestimate"];
        self.timeoriginalestimate = [decoder decodeObjectForKey:@"timeoriginalestimate"];
        self.summary = [decoder decodeObjectForKey:@"summary"];
        self.updated = [decoder decodeObjectForKey:@"updated"];
        self.versions = [decoder decodeObjectForKey:@"versions"];
        self.votes = [decoder decodeObjectForKey:@"votes"];
        self.watches = [decoder decodeObjectForKey:@"watches"];
        self.workratio = [decoder decodeObjectForKey:@"workratio"];
    }
    return self;
}

+ (JIRIssueFields *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFields *instance = [[JIRIssueFields alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"aggregateprogress"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.aggregateprogress = [JIRIssueFieldsAggregateprogress instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"assignee"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.assignee = [JIRIssueFieldsAssignee instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"components"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.components = myMembers;

        }

    } else if ([key isEqualToString:@"creator"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.creator = [JIRIssueFieldsCreator instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"fixVersions"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.fixVersions = myMembers;

        }

    } else if ([key isEqualToString:@"issuelinks"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.issuelinks = myMembers;

        }

    } else if ([key isEqualToString:@"issuetype"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.issuetype = [JIRIssueFieldsIssuetype instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"labels"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.labels = myMembers;

        }

    } else if ([key isEqualToString:@"priority"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.priority = [JIRIssueFieldsPriority instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"progress"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.progress = [JIRIssueFieldsProgress instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"project"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.project = [JIRIssueFieldsProject instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"reporter"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.reporter = [JIRIssueFieldsReporter instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"status"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.status = [JIRIssueFieldsStatus instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"subtasks"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.subtasks = myMembers;

        }

    } else if ([key isEqualToString:@"versions"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.versions = myMembers;

        }

    } else if ([key isEqualToString:@"votes"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.votes = [JIRIssueFieldsVotes instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"watches"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.watches = [JIRIssueFieldsWatches instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"customfield_10009"]) {
        [self setValue:value forKey:@"customfield10009"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else {
        
        // FIXME
        
        @try {
             [super setValue:value forUndefinedKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"Error converting:%@ %@", self, [exception description]);
        }
        @finally {
            // NOP
        }
       
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.aggregateprogress) {
        [dictionary setObject:self.aggregateprogress forKey:@"aggregateprogress"];
    }

    if (self.assignee) {
        [dictionary setObject:self.assignee forKey:@"assignee"];
    }

    if (self.components) {
        [dictionary setObject:self.components forKey:@"components"];
    }

    if (self.created) {
        [dictionary setObject:self.created forKey:@"created"];
    }

    if (self.creator) {
        [dictionary setObject:self.creator forKey:@"creator"];
    }

    if (self.customfield10009) {
        [dictionary setObject:self.customfield10009 forKey:@"customfield10009"];
    }

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.fixVersions) {
        [dictionary setObject:self.fixVersions forKey:@"fixVersions"];
    }

    if (self.issuelinks) {
        [dictionary setObject:self.issuelinks forKey:@"issuelinks"];
    }

    if (self.issuetype) {
        [dictionary setObject:self.issuetype forKey:@"issuetype"];
    }

    if (self.labels) {
        [dictionary setObject:self.labels forKey:@"labels"];
    }

    if (self.lastViewed) {
        [dictionary setObject:self.lastViewed forKey:@"lastViewed"];
    }

    if (self.priority) {
        [dictionary setObject:self.priority forKey:@"priority"];
    }

    if (self.progress) {
        [dictionary setObject:self.progress forKey:@"progress"];
    }

    if (self.project) {
        [dictionary setObject:self.project forKey:@"project"];
    }

    if (self.reporter) {
        [dictionary setObject:self.reporter forKey:@"reporter"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    if (self.subtasks) {
        [dictionary setObject:self.subtasks forKey:@"subtasks"];
    }
    
    if (self.timeestimate) {
        [dictionary setObject:self.timeestimate forKey:@"timeestimate"];
    }
    
    if (self.timeoriginalestimate) {
        [dictionary setObject:self.timeoriginalestimate forKey:@"timeoriginalestimate"];
    }

    if (self.summary) {
        [dictionary setObject:self.summary forKey:@"summary"];
    }

    if (self.updated) {
        [dictionary setObject:self.updated forKey:@"updated"];
    }

    if (self.versions) {
        [dictionary setObject:self.versions forKey:@"versions"];
    }

    if (self.votes) {
        [dictionary setObject:self.votes forKey:@"votes"];
    }

    if (self.watches) {
        [dictionary setObject:self.watches forKey:@"watches"];
    }

    if (self.workratio) {
        [dictionary setObject:self.workratio forKey:@"workratio"];
    }

    return dictionary;

}


@end
