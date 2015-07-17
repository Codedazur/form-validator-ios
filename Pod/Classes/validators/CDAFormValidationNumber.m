//
//  CDAFormValidationNumber.m
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import "CDAFormValidationNumber.h"
@interface CDAFormValidationNumber()
@property (nonatomic, strong) NSNumber *min;
@property (nonatomic, strong) NSNumber *max;
@property (nonatomic, strong) NSNumberFormatter *formatter;
@end
@implementation CDAFormValidationNumber
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
- (void)validateWithFormField:(CDAFormValidatorField *)formField AndCompletion:(void (^)(BOOL, CDAFormValidatorField *))validationResponse{
    NSString *numberString =[formField.field valueForKey:@"text"];
    NSNumber *number = [self.formatter numberFromString:numberString];
    BOOL valid = YES;
    valid = number != nil;
    validationResponse(valid, formField);
}
@end
