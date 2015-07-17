//
//  CDAFormValidator.h
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDAFormValidationRule.h"

@interface CDAFormValidator : NSObject
- (void)setErrorField:(UILabel *)errorField;
- (void) addField:(NSObject *)field WithValidationRule:(NSObject<CDAFormValidationRule> *)validationRule AndErrorMessage:(NSString *)errorMessage;
- (void)validate:(void (^)(BOOL valid, NSArray *responses))validationResponse;
- (NSArray *)allFields;
@end
