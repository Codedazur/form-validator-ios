//
//  CDAFormValidationRule.h
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDAFormValidatorField.h"

@protocol CDAFormValidationRule <NSObject>
- (void)validateWithFormField:(CDAFormValidatorField *)formField AndCompletion:(void (^)(BOOL valid, CDAFormValidatorField *field))validationResponse;
@end
