#import "JIRIssueFieldsStatus.h"

#import "JIRIssueFieldsStatusStatusCategory.h"

@implementation JIRIssueFieldsStatus

@synthesize descriptionText;
@synthesize iconUrl;
@synthesize issueFieldsStatusId;
@synthesize name;
@synthesize selfUrl;
@synthesize statusCategory;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.iconUrl forKey:@"iconUrl"];
    [encoder encodeObject:self.issueFieldsStatusId forKey:@"issueFieldsStatusId"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
    [encoder encodeObject:self.statusCategory forKey:@"statusCategory"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.iconUrl = [decoder decodeObjectForKey:@"iconUrl"];
        self.issueFieldsStatusId = [decoder decodeObjectForKey:@"issueFieldsStatusId"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
        self.statusCategory = [decoder decodeObjectForKey:@"statusCategory"];
    }
    return self;
}

+ (JIRIssueFieldsStatus *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsStatus *instance = [[JIRIssueFieldsStatus alloc] init];
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

    if ([key isEqualToString:@"statusCategory"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.statusCategory = [JIRIssueFieldsStatusStatusCategory instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"issueFieldsStatusId"];
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

    if (self.issueFieldsStatusId) {
        [dictionary setObject:self.issueFieldsStatusId forKey:@"issueFieldsStatusId"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.selfUrl) {
        [dictionary setObject:self.selfUrl forKey:@"selfUrl"];
    }

    if (self.statusCategory) {
        [dictionary setObject:self.statusCategory forKey:@"statusCategory"];
    }

    return dictionary;

}


@end
