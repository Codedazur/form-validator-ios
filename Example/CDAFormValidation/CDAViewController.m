//
//  CDAViewController.m
//  CDAFormValidation
//
//  Created by tamarabernad on 07/16/2015.
//  Copyright (c) 2015 tamarabernad. All rights reserved.
//

#import "CDAViewController.h"
#import "CDAFormValidator.h"
#import "CDAFormValidatorNotNil.h"
#import "CDAFormValidationNoEmptyString.h"
#import "CDAFormValidatorCustom.h"
#import "CDAFormValidationNumber.h"
#import "CDAFormValidationNumberInterval.h"

@interface CDAViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;
@property (weak, nonatomic) IBOutlet UITextField *tf3;
@property (weak, nonatomic) IBOutlet UITextField *tf4;
@property (weak, nonatomic) IBOutlet UILabel *lbError;
@property (nonatomic, strong) CDAFormValidator *formValidator;
@property (nonatomic, strong) NSObject *object;
@end

@implementation CDAViewController
- (IBAction)onClickValidate:(id)sender {
    [self.formValidator validate:^(BOOL valid, NSArray *responses) {
        if(valid){
            self.lbError.text = @"The form doesn't contain any errors!";
        }
        [self.lbError sizeToFit];
    }];
}
- (CDAFormValidator *)formValidator{
    if(!_formValidator){
        _formValidator = [CDAFormValidator new];
    }
    return _formValidator;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupFormValidations];
}
- (void)setupFormValidations{
    
    [self.formValidator setErrorField:self.lbError];
    [self.formValidator addField:self.tf1
              WithValidationRule:[[CDAFormValidationNoEmptyString alloc] init]
                 AndErrorMessage:@"Textfield 1 can't be empty string"];
    
    CDAFormValidatorCustom *custom = [[CDAFormValidatorCustom alloc] initWithValidationBlock:^BOOL(CDAFormValidatorField *formField) {
        UITextField *tf = (UITextField *)formField.field;
        return [tf.text containsString:@"Code Azur"];
    }];
    [self.formValidator addField:self.tf2
              WithValidationRule:custom
                 AndErrorMessage:@"Textfield 2 needs to contain Code d'Azur"];
    
    [self.formValidator addField:self.tf3
              WithValidationRule:[[CDAFormValidationNumber alloc] init]
                 AndErrorMessage:@"Textfield 3 needs to contain a number"];
    
    [self.formValidator addField:self.tf4
              WithValidationRule:[[CDAFormValidationNumberInterval alloc] initWithMin:@0 Max:@10]
                 AndErrorMessage:@"Textfield 4 needs to contain a number between 0-10"];
}

@end
