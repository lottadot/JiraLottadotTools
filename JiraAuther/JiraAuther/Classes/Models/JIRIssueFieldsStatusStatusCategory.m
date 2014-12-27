#import "JIRIssueFieldsStatusStatusCategory.h"

@implementation JIRIssueFieldsStatusStatusCategory

@synthesize colorName;
@synthesize issueFieldsStatusStatusCategoryId;
@synthesize key;
@synthesize name;
@synthesize selfUrl;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.colorName forKey:@"colorName"];
    [encoder encodeObject:self.issueFieldsStatusStatusCategoryId forKey:@"issueFieldsStatusStatusCategoryId"];
    [encoder encodeObject:self.key forKey:@"key"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.colorName = [decoder decodeObjectForKey:@"colorName"];
        self.issueFieldsStatusStatusCategoryId = [decoder decodeObjectForKey:@"issueFieldsStatusStatusCategoryId"];
        self.key = [decoder decodeObjectForKey:@"key"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
    }
    return self;
}

+ (JIRIssueFieldsStatusStatusCategory *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsStatusStatusCategory *instance = [[JIRIssueFieldsStatusStatusCategory alloc] init];
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
        [self setValue:value forKey:@"issueFieldsStatusStatusCategoryId"];
    } else if ([key isEqualToString:@"self"]) {
        [self setValue:value forKey:@"selfUrl"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.colorName) {
        [dictionary setObject:self.colorName forKey:@"colorName"];
    }

    if (self.issueFieldsStatusStatusCategoryId) {
        [dictionary setObject:self.issueFieldsStatusStatusCategoryId forKey:@"issueFieldsStatusStatusCategoryId"];
    }

    if (self.key) {
        [dictionary setObject:self.key forKey:@"key"];
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
