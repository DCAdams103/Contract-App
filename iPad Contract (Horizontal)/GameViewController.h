//
//  GameViewController.h
//  iPad Contract (Horizontal)
//

//  Copyright (c) 2016 Dylan Adams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface GameViewController : UIViewController <UIScrollViewDelegate> {
    
    SKView *skView;
    
    CGPoint scrollPoint;
    CGPoint bottomOfScreen;
    
    NSTimer *getInput, *goBack;
    BOOL canContinue;
    NSString *stringToPass;
    //IBOutlet UITextField *studentNameField;
    NSDateFormatter *dateFormatter;
    UITapGestureRecognizer *tapGesture;
    
    SecondViewController *secondViewController;
    SecondViewController *second;
    
}

-(IBAction)changeDate:(id)sender;
-(IBAction)returnKeyButton:(id)sender;
-(IBAction)goBack:(id)sender;
-(IBAction)changeSig:(id)sender;

@property (nonatomic, weak) IBOutlet UIButton *changeSigButton;

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

@property (nonatomic, assign) BOOL changeInfo1;
@property (nonatomic, assign) BOOL newsletterYN;
@property (nonatomic, assign) BOOL canSwitchViews;
@property (nonatomic, assign) BOOL canGoBack;

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (nonatomic, weak) IBOutlet __weak SKView *currentViewController;

@property (nonatomic, weak) __weak IBOutlet UITextView *textParagraph1;
@property (nonatomic, weak) __weak IBOutlet UITextView *textParagraph2;
@property (nonatomic, weak) __weak IBOutlet UITextView *textParagraph3;

@property (nonatomic, weak) __weak IBOutlet UILabel *studentNameLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *parentNameLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *semesterLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *fallLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *dayLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *numOfLessonsLabel;

@property (nonatomic, weak) __weak SecondViewController *secondView;
@property (nonatomic, weak) __weak IBOutlet UILabel *errorLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *errorLabel1;
@property (nonatomic, weak) __weak IBOutlet UILabel *errorLabel2;
@property (nonatomic, strong) NSString *dateString;

@property (nonatomic, weak) __weak IBOutlet UISwitch *payFullSwitch;
@property (nonatomic, weak) __weak IBOutlet UISwitch *payDraftSwitch;
@property (nonatomic, weak) __weak IBOutlet UISwitch *newsletterSwitch;
@property (nonatomic, weak) __weak IBOutlet UITextField *studentNameField;
@property (nonatomic, weak) __weak IBOutlet UITextField *parentNameField;
@property (nonatomic, weak) __weak IBOutlet UITextField *emailField;
@property (nonatomic, weak) __weak IBOutlet UITextField *dayField;
@property (nonatomic, weak) __weak IBOutlet UITextField *timeField;
@property (nonatomic, weak) __weak IBOutlet UITextField *numLessonsField;
@property (nonatomic, weak) __weak IBOutlet UITextField *phoneNumberField;
@property (nonatomic, weak) __weak IBOutlet UITextField *instructorNameField;
@property (nonatomic, weak) __weak IBOutlet UITextField *numOfLessonsField;
@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) __weak IBOutlet UIButton *continueButton;

@property (nonatomic, strong) NSString *emptyFieldString;
@property (nonatomic, strong) NSString *noSelectedPaymentString;
@property (nonatomic, strong) NSString *twoSelectedPaymentString;

@property (nonatomic, strong) NSString *studentNameString;
@property (nonatomic, strong) NSString *parentNameString;
@property (nonatomic, strong) NSString *emailString;
@property (nonatomic, strong) NSString *dayString;
@property (nonatomic, strong) NSString *timeString;
@property (nonatomic, strong) NSString *numLessonsString;
@property (nonatomic, strong) NSString *dateString2;
@property (nonatomic, strong) NSString *phoneNumberString;
@property (nonatomic, strong) NSString *instructorNameString;
@property (nonatomic, strong) NSString *errorLabelFade;

@property (nonatomic, assign) BOOL noSelectedPayment;
@property (nonatomic, assign) BOOL emptyFields;
@property (nonatomic, assign) BOOL payingFull;
@property (nonatomic, assign) BOOL payingDraft;
@property (nonatomic, assign) BOOL studentNameFilled;
@property (nonatomic, assign) BOOL parentNameFilled;
@property (nonatomic, assign) BOOL emailFilled;
@property (nonatomic, assign) BOOL dayFilled;
@property (nonatomic, assign) BOOL timeFilled;
@property (nonatomic, assign) BOOL numOfLessonsFilled;
@property (nonatomic, assign) BOOL dateFilled;
@property (nonatomic, assign) BOOL phoneNumberFilled;
@property (nonatomic, assign) BOOL instructorNameFilled;
@property (nonatomic, assign) BOOL doesLessonsHasNum;
@property (nonatomic, assign) BOOL doesPhoneHasNum;
@property (nonatomic, assign) BOOL changeInfoBool;
@property (nonatomic, assign) BOOL turnPayFullOn;
@property (nonatomic, assign) BOOL turnPayDraftOn;

@property (nonatomic, assign) int lessonsInt;

@property (nonatomic, strong) UIImageView *contractScreenshot;

@property (nonatomic, weak) __weak IBOutlet UIImageView *qnm;
@property (nonatomic, strong) UIImage *signatureScreenshotSave;
@property (nonatomic, weak) __weak IBOutlet UILabel *hiddenDateLabel;
@property (nonatomic, weak) __weak IBOutlet UIButton *hiddenDateChangeButton;

@end
