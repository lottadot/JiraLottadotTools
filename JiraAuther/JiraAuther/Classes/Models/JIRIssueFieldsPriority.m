#import "JIRIssueFieldsPriority.h"

@implementation JIRIssueFieldsPriority

@synthesize iconUrl;
@synthesize issueFieldsPriorityId;
@synthesize name;
@synthesize selfUrl;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.iconUrl forKey:@"iconUrl"];
    [encoder encodeObject:self.issueFieldsPriorityId forKey:@"issueFieldsPriorityId"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.iconUrl = [decoder decodeObjectForKey:@"iconUrl"];
        self.issueFieldsPriorityId = [decoder decodeObjectForKey:@"issueFieldsPriorityId"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
    }
    return self;
}

+ (JIRIssueFieldsPriority *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsPriority *instance = [[JIRIssueFieldsPriority alloc] init];
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

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"issueFieldsPriorityId"];
    } else if ([key isEqualToString:@"self"]) {
        [self setValue:value forKey:@"selfUrl"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.iconUrl) {
        [dictionary setObject:self.iconUrl forKey:@"iconUrl"];
    }

    if (self.issueFieldsPriorityId) {
        [dictionary setObject:self.issueFieldsPriorityId forKey:@"issueFieldsPriorityId"];
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
