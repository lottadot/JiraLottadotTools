#import "JIRIssues.h"

#import "JIRIssue.h"

@implementation JIRIssues

@synthesize expand;
@synthesize issues;
@synthesize maxResults;
@synthesize startAt;
@synthesize total;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.expand forKey:@"expand"];
    [encoder encodeObject:self.issues forKey:@"issues"];
    [encoder encodeObject:self.maxResults forKey:@"maxResults"];
    [encoder encodeObject:self.startAt forKey:@"startAt"];
    [encoder encodeObject:self.total forKey:@"total"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.expand = [decoder decodeObjectForKey:@"expand"];
        self.issues = [decoder decodeObjectForKey:@"issues"];
        self.maxResults = [decoder decodeObjectForKey:@"maxResults"];
        self.startAt = [decoder decodeObjectForKey:@"startAt"];
        self.total = [decoder decodeObjectForKey:@"total"];
    }
    return self;
}

+ (JIRIssues *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssues *instance = [[JIRIssues alloc] init];
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

    if ([key isEqualToString:@"issues"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                JIRIssue *populatedMember = [JIRIssue instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.issues = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.expand) {
        [dictionary setObject:self.expand forKey:@"expand"];
    }

    if (self.issues) {
        [dictionary setObject:self.issues forKey:@"issues"];
    }

    if (self.maxResults) {
        [dictionary setObject:self.maxResults forKey:@"maxResults"];
    }

    if (self.startAt) {
        [dictionary setObject:self.startAt forKey:@"startAt"];
    }

    if (self.total) {
        [dictionary setObject:self.total forKey:@"total"];
    }

    return dictionary;

}


@end
