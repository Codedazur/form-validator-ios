/*
 
 Copyright (c) 2015 Code d'Azur <info@codedazur.nl>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 */

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
