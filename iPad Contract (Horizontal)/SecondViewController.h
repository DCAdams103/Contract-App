//
//  SecondViewController.h
//  iPad Contract (Horizontal)
//
//  Created by Dylan Adams on 6/29/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinearInterpView.h"
#import "ThirdViewController.h"

@interface SecondViewController : UIViewController{
    
    NSString *passValue;
    UIImageView *savedSignature;
    BOOL canContinue;
    
}

-(IBAction)continueMethod:(id)sender;
-(IBAction)clearMethod:(id)sender;
-(IBAction)backMethod:(id)sender;

@property (nonatomic, weak) __weak IBOutlet LinearInterpView *signatureView;

@property (nonatomic, weak) __weak IBOutlet UIButton *backButton;

@property (nonatomic, weak) __weak IBOutlet UILabel *errorLabel;

@property (nonatomic, weak) __weak UITextView *textParagraph11;
@property (nonatomic, weak) __weak UITextView *textParagraph21;
@property (nonatomic, weak) __weak UITextView *textParagraph31;

@property (nonatomic, assign) BOOL payFullTrue;
@property (nonatomic, assign) BOOL payDraftTrue;
@property (nonatomic, assign) BOOL changeInfoBool1;
@property (nonatomic, assign) BOOL changeSignatureBool1;
@property (nonatomic, assign) BOOL newsletterYN;

@property (nonatomic, strong) NSString *studentNameString;
@property (nonatomic, strong) NSString *parentNameString;
@property (nonatomic, strong) NSString *emailString;
@property (nonatomic, strong) NSString *dayString;
@property (nonatomic, strong) NSString *timeString;
@property (nonatomic, strong) NSString *numLessonsString;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSString *phoneNumber1;
@property (nonatomic, strong) NSString *instructorName1;

@property (nonatomic, strong) UIImageView *signatureScreenshot;
@property (nonatomic, strong) UIImageView *contractScreenshot1;

@property (nonatomic, strong) UIImage *signature_screenshot;
@property (nonatomic, strong) UIImage *signatureScreenshotSave1;

@end
