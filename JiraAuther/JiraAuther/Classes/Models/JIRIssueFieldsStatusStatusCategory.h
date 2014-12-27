#import <Foundation/Foundation.h>

@interface JIRIssueFieldsStatusStatusCategory : NSObject <NSCoding> {

    NSString *colorName;
    NSNumber *issueFieldsStatusStatusCategoryId;
    NSString *key;
    NSString *name;
    NSString *selfUrl;

}

@property (nonatomic, copy) NSString *colorName;
@property (nonatomic, copy) NSNumber *issueFieldsStatusStatusCategoryId;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *selfUrl;

+ (JIRIssueFieldsStatusStatusCategory *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
