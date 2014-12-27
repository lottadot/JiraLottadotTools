#import "JIRIssue.h"

#import "JIRIssueFields.h"

@implementation JIRIssue

@synthesize expand;
@synthesize fields;
@synthesize issueId;
@synthesize key;
@synthesize selfURL;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.expand forKey:@"expand"];
    [encoder encodeObject:self.fields forKey:@"fields"];
    [encoder encodeObject:self.issueId forKey:@"issueId"];
    [encoder encodeObject:self.key forKey:@"key"];
    [encoder encodeObject:self.selfURL forKey:@"selfURL"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.expand = [decoder decodeObjectForKey:@"expand"];
        self.fields = [decoder decodeObjectForKey:@"fields"];
        self.issueId = [decoder decodeObjectForKey:@"issueId"];
        self.key = [decoder decodeObjectForKey:@"key"];
        self.selfURL = [decoder decodeObjectForKey:@"selfURL"];
    }
    return self;
}

+ (JIRIssue *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssue *instance = [[JIRIssue alloc] init];
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

    if ([key isEqualToString:@"fields"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.fields = [JIRIssueFields instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"issueId"];
    } else if ([key isEqualToString:@"self"]) {
        [self setValue:value forKey:@"selfURL"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.expand) {
        [dictionary setObject:self.expand forKey:@"expand"];
    }

    if (self.fields) {
        [dictionary setObject:self.fields forKey:@"fields"];
    }

    if (self.issueId) {
        [dictionary setObject:self.issueId forKey:@"issueId"];
    }

    if (self.key) {
        [dictionary setObject:self.key forKey:@"key"];
    }

    if (self.selfURL) {
        [dictionary setObject:self.selfURL forKey:@"selfURL"];
    }

    return dictionary;

}


@end
