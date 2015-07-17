//
//  CDAFormValidationNumberInterval.m
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import "CDAFormValidationNumberInterval.h"
@interface CDAFormValidationNumberInterval()
@property (nonatomic, strong) NSNumber *min;
@property (nonatomic, strong) NSNumber *max;
@property (nonatomic, strong) NSNumberFormatter *formatter;
@end
@implementation CDAFormValidationNumberInterval
- (NSNumberFormatter *)formatter{
    if(!_formatter){
        _formatter = [NSNumberFormatter new];
        [_formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [_formatter setMinimumFractionDigits:0];
        //TODO ask Rene what kind of separation we accept
        [_formatter setDecimalSeparator:@","];
        
    }
    return _formatter;
}
- (id)initWithMin:(NSNumber *)min Max:(NSNumber *)max{
    if(self = [super init]){
        self.min = min;
        self.max = max;
    }
    return self;
}
- (void)validateWithFormField:(CDAFormValidatorField *)formField AndCompletion:(void (^)(BOOL, CDAFormValidatorField *))validationResponse{
    NSString *numberString =[formField.field valueForKey:@"text"];
    NSNumber *number = [self.formatter numberFromString:numberString];
    BOOL valid = YES;
    valid = number != nil;
    
    valid = self.min != nil ? valid && ([self.min compare:number] == NSOrderedAscending || [self.min compare:number] == NSOrderedSame) : valid;
    valid = self.max != nil ? valid && ([self.max compare:number] == NSOrderedDescending || [self.max compare:number] == NSOrderedSame) : valid;
    
    validationResponse(valid, formField);
}
@end
