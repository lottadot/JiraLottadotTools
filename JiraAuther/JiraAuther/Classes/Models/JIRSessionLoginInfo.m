#import "JIRSessionLoginInfo.h"

@implementation JIRSessionLoginInfo

@synthesize failedLoginCount;
@synthesize lastFailedLoginTime;
@synthesize loginCount;
@synthesize previousLoginTime;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.failedLoginCount forKey:@"failedLoginCount"];
    [encoder encodeObject:self.lastFailedLoginTime forKey:@"lastFailedLoginTime"];
    [encoder encodeObject:self.loginCount forKey:@"loginCount"];
    [encoder encodeObject:self.previousLoginTime forKey:@"previousLoginTime"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.failedLoginCount = [decoder decodeObjectForKey:@"failedLoginCount"];
        self.lastFailedLoginTime = [decoder decodeObjectForKey:@"lastFailedLoginTime"];
        self.loginCount = [decoder decodeObjectForKey:@"loginCount"];
        self.previousLoginTime = [decoder decodeObjectForKey:@"previousLoginTime"];
    }
    return self;
}

+ (JIRSessionLoginInfo *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRSessionLoginInfo *instance = [[JIRSessionLoginInfo alloc] init];
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

    if (self.failedLoginCount) {
        [dictionary setObject:self.failedLoginCount forKey:@"failedLoginCount"];
    }

    if (self.lastFailedLoginTime) {
        [dictionary setObject:self.lastFailedLoginTime forKey:@"lastFailedLoginTime"];
    }

    if (self.loginCount) {
        [dictionary setObject:self.loginCount forKey:@"loginCount"];
    }

    if (self.previousLoginTime) {
        [dictionary setObject:self.previousLoginTime forKey:@"previousLoginTime"];
    }

    return dictionary;

}


@end
