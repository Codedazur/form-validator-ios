//
//  CDAFormValidatorNotNil.h
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CDAFormValidationRule.h"
@interface CDAFormValidatorNotNil : NSObject<CDAFormValidationRule>
- (id)initWithKey:(NSString *)key;
@end
