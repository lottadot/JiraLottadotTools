#import <Foundation/Foundation.h>

@interface JIRIssueFieldsAggregateprogress : NSObject <NSCoding> {

    NSNumber *progress;
    NSNumber *total;

}

@property (nonatomic, copy) NSNumber *progress;
@property (nonatomic, copy) NSNumber *total;

+ (JIRIssueFieldsAggregateprogress *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
