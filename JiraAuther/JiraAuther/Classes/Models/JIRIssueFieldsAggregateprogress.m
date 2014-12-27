#import "JIRIssueFieldsAggregateprogress.h"

@implementation JIRIssueFieldsAggregateprogress

@synthesize progress;
@synthesize total;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.progress forKey:@"progress"];
    [encoder encodeObject:self.total forKey:@"total"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.progress = [decoder decodeObjectForKey:@"progress"];
        self.total = [decoder decodeObjectForKey:@"total"];
    }
    return self;
}

+ (JIRIssueFieldsAggregateprogress *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsAggregateprogress *instance = [[JIRIssueFieldsAggregateprogress alloc] init];
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

- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.progress) {
        [dictionary setObject:self.progress forKey:@"progress"];
    }

    if (self.total) {
        [dictionary setObject:self.total forKey:@"total"];
    }

    return dictionary;

}


@end
