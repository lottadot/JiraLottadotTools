#import "JIRIssueFieldsIssuetype.h"

@implementation JIRIssueFieldsIssuetype

@synthesize descriptionText;
@synthesize iconUrl;
@synthesize issueFieldsIssuetypeId;
@synthesize name;
@synthesize selfUrl;
@synthesize subtask;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.iconUrl forKey:@"iconUrl"];
    [encoder encodeObject:self.issueFieldsIssuetypeId forKey:@"issueFieldsIssuetypeId"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
    [encoder encodeObject:[NSNumber numberWithBool:self.subtask] forKey:@"subtask"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.iconUrl = [decoder decodeObjectForKey:@"iconUrl"];
        self.issueFieldsIssuetypeId = [decoder decodeObjectForKey:@"issueFieldsIssuetypeId"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
        self.subtask = [(NSNumber *)[decoder decodeObjectForKey:@"subtask"] boolValue];
    }
    return self;
}

+ (JIRIssueFieldsIssuetype *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsIssuetype *instance = [[JIRIssueFieldsIssuetype alloc] init];
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"issueFieldsIssuetypeId"];
    } else if ([key isEqualToString:@"self"]) {
        [self setValue:value forKey:@"selfUrl"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.iconUrl) {
        [dictionary setObject:self.iconUrl forKey:@"iconUrl"];
    }

    if (self.issueFieldsIssuetypeId) {
        [dictionary setObject:self.issueFieldsIssuetypeId forKey:@"issueFieldsIssuetypeId"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.selfUrl) {
        [dictionary setObject:self.selfUrl forKey:@"selfUrl"];
    }

    [dictionary setObject:[NSNumber numberWithBool:self.subtask] forKey:@"subtask"];

    return dictionary;

}


@end
