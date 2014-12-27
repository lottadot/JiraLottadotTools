#import "JIRIssueFieldsWatches.h"

@implementation JIRIssueFieldsWatches

@synthesize isWatching;
@synthesize selfUrl;
@synthesize watchCount;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:[NSNumber numberWithBool:self.isWatching] forKey:@"isWatching"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
    [encoder encodeObject:self.watchCount forKey:@"watchCount"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.isWatching = [(NSNumber *)[decoder decodeObjectForKey:@"isWatching"] boolValue];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
        self.watchCount = [decoder decodeObjectForKey:@"watchCount"];
    }
    return self;
}

+ (JIRIssueFieldsWatches *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsWatches *instance = [[JIRIssueFieldsWatches alloc] init];
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

    [dictionary setObject:[NSNumber numberWithBool:self.isWatching] forKey:@"isWatching"];

    if (self.selfUrl) {
        [dictionary setObject:self.selfUrl forKey:@"selfUrl"];
    }

    if (self.watchCount) {
        [dictionary setObject:self.watchCount forKey:@"watchCount"];
    }

    return dictionary;

}


@end
