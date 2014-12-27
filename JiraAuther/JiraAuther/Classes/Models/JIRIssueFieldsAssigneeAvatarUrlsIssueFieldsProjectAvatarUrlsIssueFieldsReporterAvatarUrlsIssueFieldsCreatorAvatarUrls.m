#import "JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls.h"

@implementation JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls

@synthesize avatar16x16;
@synthesize avatar24x24;
@synthesize avatar32x32;
@synthesize avatar48x48;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.avatar16x16 forKey:@"avatar16x16"];
    [encoder encodeObject:self.avatar24x24 forKey:@"avatar24x24"];
    [encoder encodeObject:self.avatar32x32 forKey:@"avatar32x32"];
    [encoder encodeObject:self.avatar48x48 forKey:@"avatar48x48"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.avatar16x16 = [decoder decodeObjectForKey:@"avatar16x16"];
        self.avatar24x24 = [decoder decodeObjectForKey:@"avatar24x24"];
        self.avatar32x32 = [decoder decodeObjectForKey:@"avatar32x32"];
        self.avatar48x48 = [decoder decodeObjectForKey:@"avatar48x48"];
    }
    return self;
}

+ (JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls *instance = [[JIRIssueFieldsAssigneeAvatarUrlsIssueFieldsProjectAvatarUrlsIssueFieldsReporterAvatarUrlsIssueFieldsCreatorAvatarUrls alloc] init];
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

    if ([key isEqualToString:@"16x16"]) {
        [self setValue:value forKey:@"avatar16x16"];
    } else if ([key isEqualToString:@"24x24"]) {
        [self setValue:value forKey:@"avatar24x24"];
    } else if ([key isEqualToString:@"32x32"]) {
        [self setValue:value forKey:@"avatar32x32"];
    } else if ([key isEqualToString:@"48x48"]) {
        [self setValue:value forKey:@"avatar48x48"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.avatar16x16) {
        [dictionary setObject:self.avatar16x16 forKey:@"avatar16x16"];
    }

    if (self.avatar24x24) {
        [dictionary setObject:self.avatar24x24 forKey:@"avatar24x24"];
    }

    if (self.avatar32x32) {
        [dictionary setObject:self.avatar32x32 forKey:@"avatar32x32"];
    }

    if (self.avatar48x48) {
        [dictionary setObject:self.avatar48x48 forKey:@"avatar48x48"];
    }

    return dictionary;

}


@end
