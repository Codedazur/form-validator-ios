//
//  CDAFormValidator.m
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

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
    
    for (int i=0,n=self.formValidatorRules.count; i<n; i++) {
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


