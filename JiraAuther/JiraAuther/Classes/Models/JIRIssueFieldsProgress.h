#import <Foundation/Foundation.h>

@interface JIRIssueFieldsProgress : NSObject <NSCoding> {

    NSNumber *progress;
    NSNumber *total;

}

@property (nonatomic, copy) NSNumber *progress;
@property (nonatomic, copy) NSNumber *total;

+ (JIRIssueFieldsProgress *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
