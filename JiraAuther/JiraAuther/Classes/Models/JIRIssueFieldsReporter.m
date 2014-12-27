#import "JIRIssueFieldsReporter.h"

#import "JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls.h"

@implementation JIRIssueFieldsReporter

@synthesize active;
@synthesize avatarUrls;
@synthesize displayName;
@synthesize emailAddress;
@synthesize name;
@synthesize selfUrl;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:[NSNumber numberWithBool:self.active] forKey:@"active"];
    [encoder encodeObject:self.avatarUrls forKey:@"avatarUrls"];
    [encoder encodeObject:self.displayName forKey:@"displayName"];
    [encoder encodeObject:self.emailAddress forKey:@"emailAddress"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.active = [(NSNumber *)[decoder decodeObjectForKey:@"active"] boolValue];
        self.avatarUrls = [decoder decodeObjectForKey:@"avatarUrls"];
        self.displayName = [decoder decodeObjectForKey:@"displayName"];
        self.emailAddress = [decoder decodeObjectForKey:@"emailAddress"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
    }
    return self;
}

+ (JIRIssueFieldsReporter *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsReporter *instance = [[JIRIssueFieldsReporter alloc] init];
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

    if ([key isEqualToString:@"avatarUrls"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.avatarUrls = [JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"self"]) {
        [self setValue:value forKey:@"selfUrl"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    [dictionary setObject:[NSNumber numberWithBool:self.active] forKey:@"active"];

    if (self.avatarUrls) {
        [dictionary setObject:self.avatarUrls forKey:@"avatarUrls"];
    }

    if (self.displayName) {
        [dictionary setObject:self.displayName forKey:@"displayName"];
    }

    if (self.emailAddress) {
        [dictionary setObject:self.emailAddress forKey:@"emailAddress"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.selfUrl) {
        [dictionary setObject:self.selfUrl forKey:@"selfUrl"];
    }

    return dictionary;

}


@end
