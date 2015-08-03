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

#import "CDAFormValidator.h"
#import "CDAFormValidatorField.h"


@interface CDAFormValidator()
@property (nonatomic, strong)NSArray *formValidatorFields;
@property (nonatomic, strong)NSArray *formValidatorRules;
@property (nonatomic, weak) UILabel *errorField;
@end
@implementation CDAFormValidator
- (void)setErrorField:(UILabel *)errorField{
    _errorField = errorField;
}
- (NSArray *)allFields{
    return [self.formValidatorFields valueForKey:@"field"];
}
- (NSArray *)formValidatorRules{
    if(!_formValidatorRules){
        _formValidatorRules = [NSArray new];
    }
    return _formValidatorRules;
}
- (NSArray *)formValidatorFields{
    if(!_formValidatorFields){
        _formValidatorFields = [NSArray new];
    }
    return _formValidatorFields;
}
- (void)addField:(NSObject *)field WithValidationRule:(NSObject<CDAFormValidationRule> *)validationRule AndErrorMessage:(NSString *)errorMessage{
    CDAFormValidatorField *validationField = [CDAFormValidatorField new];
    validationField.field = field;
    validationField.errorMessage = errorMessage;
    
    self.formValidatorRules = [self.formValidatorRules arrayByAddingObject:validationRule];
    
    self.formValidatorFields = [self.formValidatorFields arrayByAddingObject:validationField];
}
- (void)validate:(void (^)(BOOL, NSArray *))validationResponse{
    BOOL __block allValid = YES;
    NSArray __block *erroringFields = [NSArray new];
    NSInteger __block counter = 0;
    NSInteger __block total = self.formValidatorFields.count;
    
    for (NSUInteger i=0,n=self.formValidatorRules.count; i<n; i++) {
        CDAFormValidatorField *formField = [self.formValidatorFields objectAtIndex:i];
        NSObject<CDAFormValidationRule> *validationRule = [self.formValidatorRules objectAtIndex:i];
        [validationRule validateWithFormField:formField AndCompletion:^(BOOL valid, CDAFormValidatorField *field) {
            allValid = allValid && valid;
            if(!valid){
                erroringFields = [erroringFields arrayByAddingObject:field];
            }
            counter++;
            if (counter == total) {
                
                if (!allValid) {
                    
                    for (CDAFormValidatorField *validatorField in erroringFields) {
                        if([validatorField.field respondsToSelector:@selector(hasError:)]){
                            [validatorField.field performSelector:@selector(hasError:) withObject:@YES];
                        }
                    }
                    CDAFormValidatorField *validatorField = [erroringFields objectAtIndex:0];
                    self.errorField.text = validatorField.errorMessage;
                    [self.errorField sizeToFit];
                }
                
                validationResponse(allValid,erroringFields);
            }
        }];
    }
}
@end


