#import "JIRSession.h"

#import "JIRSessionLoginInfo.h"

@implementation JIRSession

@synthesize loginInfo;
@synthesize name;
@synthesize selfUrl;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.loginInfo forKey:@"loginInfo"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.selfUrl forKey:@"selfUrl"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.loginInfo = [decoder decodeObjectForKey:@"loginInfo"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.selfUrl = [decoder decodeObjectForKey:@"selfUrl"];
    }
    return self;
}

+ (JIRSession *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRSession *instance = [[JIRSession alloc] init];
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

    if ([key isEqualToString:@"loginInfo"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.loginInfo = [JIRSessionLoginInfo instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

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

    if (self.loginInfo) {
        [dictionary setObject:self.loginInfo forKey:@"loginInfo"];
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
