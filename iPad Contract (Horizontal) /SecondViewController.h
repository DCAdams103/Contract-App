//
//  SecondViewController.h
//  iPad Contract (Horizontal)
//
//  Created by Dylan Adams on 6/29/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinearInterpView.h"


@interface SecondViewController : UIViewController{
    
    NSString *passValue;
    UIImageView *savedSignature;
    BOOL canContinue;
    
}

-(IBAction)continueMethod:(id)sender;
-(IBAction)clearMethod:(id)sender;
-(IBAction)backMethod:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *Paragraph;

@property (nonatomic, weak) __weak IBOutlet LinearInterpView *signatureView;

@property (nonatomic, weak) __weak IBOutlet UIButton *backButton;

@property (nonatomic, weak) __weak IBOutlet UILabel *errorLabel;

@property (nonatomic, weak) __weak UITextView *textParagraph11;
@property (nonatomic, weak) __weak UITextView *textParagraph21;
@property (nonatomic, weak) __weak UITextView *textParagraph31;

//@property (nonatomic, assign) BOOL _017SpringChoice;
//@property (nonatomic, assign) BOOL _017SummerChoice;
@property (nonatomic, assign) BOOL _017FallChoice;
@property (nonatomic, assign) BOOL payFullTrue;
@property (nonatomic, assign) BOOL payDraftTrue;
@property (nonatomic, assign) BOOL payDepositTrue;
@property (nonatomic, assign) BOOL changeInfoBool1;
@property (nonatomic, assign) BOOL changeSignatureBool1;
@property (nonatomic, assign) BOOL newsletterYN;

@property (nonatomic, weak) NSString *studentNameString;
@property (nonatomic, weak) NSString *parentNameString;
@property (nonatomic, weak) NSString *emailString;
@property (nonatomic, weak) NSString *dayString;
@property (nonatomic, weak) NSString *timeString;
@property (nonatomic, weak) NSString *numLessonsString;
@property (nonatomic, weak) NSString *dateString;
@property (nonatomic, weak) NSString *phoneNumber1;
@property (nonatomic, weak) NSString *instructorName1;

@property (nonatomic, strong) UIImageView *signatureScreenshot;
@property (nonatomic, strong) UIImageView *contractScreenshot1;

@property (nonatomic, strong) UIImage *signature_screenshot;
@property (nonatomic, strong) UIImage *signatureScreenshotSave1;

@end
