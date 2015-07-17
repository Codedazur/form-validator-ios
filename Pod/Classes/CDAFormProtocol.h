//
//  CDAFormProtocol.h
//  kvadrat-softcells-ipad
//
//  Created by Tamara Bernad on 13/05/15.
//  Copyright (c) 2015 Code d'Azur. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CDAFormProtocol <NSObject>
- (void)validate:(void (^)(BOOL valid))validationResponse;
@end
