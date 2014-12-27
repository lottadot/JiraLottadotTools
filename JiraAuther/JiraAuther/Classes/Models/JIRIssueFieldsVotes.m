#import "JIRIssueFieldsVotes.h"

@implementation JIRIssueFieldsVotes

@synthesize hasVoted;
@synthesize selfUrl;
@synthesize votes;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:[NSNumber numberWithBool:self.hasVoted] forKey:@"hasVoted"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
    [encoder encodeObject:self.votes forKey:@"votes"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.hasVoted = [(NSNumber *)[decoder decodeObjectForKey:@"hasVoted"] boolValue];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
        self.votes = [decoder decodeObjectForKey:@"votes"];
    }
    return self;
}

+ (JIRIssueFieldsVotes *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsVotes *instance = [[JIRIssueFieldsVotes alloc] init];
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

    if ([key isEqualToString:@"self"]) {
        [self setValue:value forKey:@"selfUrl"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    [dictionary setObject:[NSNumber numberWithBool:self.hasVoted] forKey:@"hasVoted"];

    if (self.selfUrl) {
        [dictionary setObject:self.selfUrl forKey:@"selfUrl"];
    }

    if (self.votes) {
        [dictionary setObject:self.votes forKey:@"votes"];
    }

    return dictionary;

}


@end
