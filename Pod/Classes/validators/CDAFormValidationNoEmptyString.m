//
//  CDAFormValidationRuleRequired.m
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import "CDAFormValidationNoEmptyString.h"

@implementation CDAFormValidationNoEmptyString
- (void)validateWithFormField:(CDAFormValidatorField *)formField AndCompletion:(void (^)(BOOL, CDAFormValidatorField *))validationResponse{
    validationResponse(![[formField.field valueForKey:@"text"] isEqualToString:@""], formField);
}
@end
