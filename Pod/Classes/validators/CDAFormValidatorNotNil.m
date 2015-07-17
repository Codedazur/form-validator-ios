//
//  CDAFormValidatorNotNil.m
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import "CDAFormValidatorNotNil.h"
@interface CDAFormValidatorNotNil()
@property (nonatomic, strong)NSString *key;
@end

@implementation CDAFormValidatorNotNil
- (id)initWithKey:(NSString *)key{
    if(self = [super init]){
        self.key = key;
    }
    return self;
}
- (void)validateWithFormField:(CDAFormValidatorField *)formField AndCompletion:(void (^)(BOOL, CDAFormValidatorField *))validationResponse
{
    NSObject *value = [formField.field valueForKey:self.key];
    BOOL valid = value != nil;
    validationResponse(valid, formField);
}
@end
