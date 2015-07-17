//
//  CDAFormValidatorField.h
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 11/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CDAFormValidatorField : NSObject

@property (nonatomic, weak) NSObject *field;
@property (nonatomic, strong)NSString *errorMessage;

@end
