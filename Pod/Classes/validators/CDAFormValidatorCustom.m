//
//  CDAFormValidatorCustom.m
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 13/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import "CDAFormValidatorCustom.h"
@interface CDAFormValidatorCustom()
@property (nonatomic, strong) CustomFormValidation validationBlock;
@end

@implementation CDAFormValidatorCustom
- (instancetype)initWithValidationBlock:(CustomFormValidation)validationBlock{
    if (self = [super init]) {
        self.validationBlock = validationBlock;
    }
    return self;
}
- (void)validateWithFormField:(CDAFormValidatorField *)formField AndCompletion:(void (^)(BOOL, CDAFormValidatorField *))validationResponse{
    BOOL valid = self.validationBlock(formField);
    validationResponse(valid,formField);
}
@end
