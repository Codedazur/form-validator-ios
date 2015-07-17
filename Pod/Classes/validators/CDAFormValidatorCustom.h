//
//  CDAFormValidatorCustom.h
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 13/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDAFormValidationRule.h"
typedef BOOL(^CustomFormValidation)(CDAFormValidatorField *formField);

@interface CDAFormValidatorCustom : NSObject<CDAFormValidationRule>
- (instancetype)initWithValidationBlock:(CustomFormValidation)validationBlock;
@end
