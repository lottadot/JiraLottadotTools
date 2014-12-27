#import "JIRProject.h"

#import "JIRProjectAvatarUrls.h"

@implementation JIRProject

@synthesize avatarUrls;
@synthesize jIRProjectId;
@synthesize key;
@synthesize name;
@synthesize selfUrl;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.avatarUrls forKey:@"avatarUrls"];
    [encoder encodeObject:self.jIRProjectId forKey:@"jIRProjectId"];
    [encoder encodeObject:self.key forKey:@"key"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.avatarUrls = [decoder decodeObjectForKey:@"avatarUrls"];
        self.jIRProjectId = [decoder decodeObjectForKey:@"jIRProjectId"];
        self.key = [decoder decodeObjectForKey:@"key"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
    }
    return self;
}

+ (JIRProject *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRProject *instance = [[JIRProject alloc] init];
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
            self.avatarUrls = [JIRProjectAvatarUrls instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"jIRProjectId"];
    } else if ([key isEqualToString:@"self"]) {
        [self setValue:value forKey:@"selfUrl"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.avatarUrls) {
        [dictionary setObject:self.avatarUrls forKey:@"avatarUrls"];
    }

    if (self.jIRProjectId) {
        [dictionary setObject:self.jIRProjectId forKey:@"jIRProjectId"];
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
