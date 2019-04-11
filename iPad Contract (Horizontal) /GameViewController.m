//
//  GameViewController.m
//  iPadTest2
//
//  Created by Dylan Adams on 6/10/16.
//  Copyright (c) 2016 Dylan Adams. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "SlideshowViewController.h"
#import <mach/mach.h>

@class SlideShowViewController;
@implementation GameViewController
@synthesize secondView;
@synthesize studentNameField;

// Based on the semester, display the correct text
- (void)viewDidLoad{
    
        if(__017FallChosen1 == TRUE){
            
            _textParagraph1.text = @"Welcome to the 2017 Fall Semester!\n\nThe 2017 Fall Semester will begin the week of July 24, 2017 and end the week of Dec 11, 2017 (20 weeks).  The calendar, including breaks and holidays, is available on our website www.QuarterNoteMusic.com.   Mid-semester pro-rates are available.";
            
            _textParagraph1.font = [UIFont systemFontOfSize:19];
            
            _semesterYearLabel.text = @"Fall 2017";
            _semesterYearLabel.font = [UIFont systemFontOfSize:17];
            
        }
        
    _changeSigButton.alpha = 0;
    _hiddenDateLabel.alpha = 0;
    _hiddenDateChangeButton.alpha = 0;
    //_backButton.alpha = 0;
    
}

// Set dates and cretes error strings.
//
-(void) viewDidAppear:(BOOL)animated{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:-30];
    NSDate *maxDate = [gregorian dateByAddingComponents:comps toDate:[NSDate date]  options:0];
    
    _canGoBack = FALSE;
    
    _canSwitchViews = TRUE;
    
    _scrollView.delegate = self;
    
    [_datePicker setMinimumDate:[NSDate date]];
    [_datePicker setMaximumDate:maxDate];
    
    // Used for when coming back to this view
    if(_turnPayFullOn == TRUE){ _payFullSwitch.on = TRUE; }
    if(_turnPayDraftOn == TRUE){ _payDraftSwitch.on = TRUE; }
    if(_turnDepositOn == TRUE){ _depositSwitch.on = TRUE; }
    if(_newsletterYN == TRUE){ _newsletterSwitch.on = TRUE; }
    
    _emptyFieldString = @"*There is one or more empty Text Field*";
    _noSelectedPaymentString = @"*There is no payment option.*";
    _twoSelectedPaymentString = @"*Please select only one payment option.*";
    
//    if(__017SpringChosen1 == TRUE){
//        
//        _depositSwitch.alpha = 1;
//        _depositLabel.alpha = 1;
//        
//    } else {
//        
//        _depositSwitch.alpha = 0;
//        _depositLabel.alpha = 0;
//        
//    }
    
    // Used for when coming back to this view
    if(_changeInfoBool == TRUE){
        
        studentNameField.text = _studentNameString;
        _parentNameField.text = _parentNameString;
        _emailField.text = _emailString;
        _confirmEmailField.text = _emailString;
        _dayField.text = _dayString;
        _timeField.text = _timeString;
        _numLessonsField.text = _numLessonsString;
        _phoneNumberField.text = _phoneNumberString;
        _instructorNameField.text = _instructorNameString;
        
        [_datePicker removeFromSuperview];
        
        _hiddenDateLabel.alpha = 1;
        _hiddenDateChangeButton.alpha = 1;
        
        _hiddenDateLabel.text = _dateString2;
        
    }
    
    [super viewDidLoad];
    
    GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    //goBack = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(goBackMethod) userInfo:nil repeats:NO];
        
}

// Segue for going to signature
-(IBAction)changeSig:(id)sender{
    
    if(_changeInfo1 == TRUE){
        
        [self performSegueWithIdentifier:@"passSegue" sender:sender];
        
    }
    
}

// Segue for going back
-(void) goBackMethod{
    
    _canGoBack = TRUE;
    _backButton.alpha = 1;
    
}

-(IBAction)goBack:(id)sender{
    
    if(_canSwitchViews == TRUE && _canGoBack == TRUE){
    
        [self performSegueWithIdentifier:@"backToSlideshowUnwind" sender:self];
        //[self dismissViewControllerAnimated:YES completion:nil];
    
    }
}

// When the return key is pressed move the cursor to the next field
-(IBAction)returnKeyButton:(id)sender{
 
    if(studentNameField.isFirstResponder){ [sender resignFirstResponder]; [_parentNameField becomeFirstResponder]; } else if(_parentNameField.isFirstResponder){
                                    [sender resignFirstResponder];
                                    [_emailField becomeFirstResponder]; } else if(_emailField.isFirstResponder){
                                    [sender resignFirstResponder];
                                        [_confirmEmailField becomeFirstResponder]; } else if (_confirmEmailField.isFirstResponder){ [sender resignFirstResponder]; [_phoneNumberField becomeFirstResponder]; } else if(_phoneNumberField.isFirstResponder){
                                        [sender resignFirstResponder];
                                        [_dayField becomeFirstResponder]; } else if(_dayField.isFirstResponder){
                                            [sender resignFirstResponder]; [_timeField becomeFirstResponder]; } else if(_timeField.isFirstResponder){
                                                [sender resignFirstResponder]; [_instructorNameField becomeFirstResponder]; } else if(_instructorNameField.isFirstResponder){
                                                    [sender resignFirstResponder];
                                                    [_numLessonsField becomeFirstResponder]; }
    
}

- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)deregisterFromKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self deregisterFromKeyboardNotifications];
    
    [super viewWillDisappear:animated];
    
}

// Once keyboard appears move fields up to be able to be seen when typing
- (void)keyboardWasShown:(NSNotification *)notification {
    
    NSDictionary* info = [notification userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGPoint datePickerOrigin = CGPointMake(378, 1380);
    
    NSLog(@"%@", NSStringFromCGPoint(datePickerOrigin));
    
    CGFloat datePickerHeight = 161;
    
    NSLog(@"%f", datePickerHeight);
    
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    bottomOfScreen = CGPointMake(0.0, datePickerOrigin.y - visibleRect.size.height + datePickerHeight - 210);
    
    if (!CGRectContainsPoint(visibleRect, datePickerOrigin)){
        
        scrollPoint = CGPointMake(0.0, datePickerOrigin.y - visibleRect.size.height + datePickerHeight - 20);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    NSLog(@"hi");
    [self.scrollView setContentOffset:bottomOfScreen animated:YES];
    
}

// Fade animation for error messages
-(IBAction)startFade:(id)sender{

    if([_errorLabelFade isEqualToString:@"ErrorLabel"]){

        _errorLabel.layer.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1].CGColor;

        [UIView animateWithDuration:2.0 animations:^{
            _errorLabel.layer.backgroundColor = [UIColor whiteColor].CGColor;
        } completion:NULL];

    }

    if ([_errorLabelFade isEqualToString:@"ErrorLabel1"]){

        _errorLabel1.layer.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1].CGColor;

        [UIView animateWithDuration:2.0 animations:^{
            _errorLabel1.layer.backgroundColor = [UIColor whiteColor].CGColor;
        } completion:NULL];

    }

    if ([_errorLabelFade isEqualToString:@"ErrorLabel2"]){

        _errorLabel2.layer.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1].CGColor;

        [UIView animateWithDuration:2.0 animations:^{
            _errorLabel2.layer.backgroundColor = [UIColor whiteColor].CGColor;
        } completion:NULL];

    }

}

// Checks to make sure everything is correct to be able to move on
-(IBAction)continueMethod:(id)sender{
    
    if(/*__017SpringChosen1 == TRUE || */__017FallChosen1 == TRUE){
        
        if(_depositSwitch.isOn || _payFullSwitch.isOn || _payDraftSwitch.isOn){ _noSelectedPayment = FALSE; _errorLabel2.text = @""; if(_emptyFields == FALSE){ canContinue = TRUE; }}

        if(_payFullSwitch.isOn){
            if(_payDraftSwitch.isOn == TRUE){  } else if (_depositSwitch.isOn == TRUE){ } else {
                _payFullSwitch.backgroundColor = UIColor.whiteColor; _payDraftSwitch.backgroundColor = UIColor.whiteColor; _depositSwitch.backgroundColor = UIColor.whiteColor; _payingFull = TRUE; canContinue = TRUE; }
        }
        
        if(_payDraftSwitch.isOn){
            if(_payFullSwitch.isOn == TRUE){  } else if(_depositSwitch.isOn == TRUE){ } else {
                _payFullSwitch.backgroundColor = UIColor.whiteColor; _payDraftSwitch.backgroundColor = UIColor.whiteColor; _depositSwitch.backgroundColor = UIColor.whiteColor; _payingDraft = TRUE; canContinue = TRUE; }
        }
        
        if(_depositSwitch.isOn){
            
            if(_payFullSwitch.isOn == TRUE){ } else if(_payDraftSwitch.isOn == TRUE){ } else {
                _payFullSwitch.backgroundColor = UIColor.whiteColor; _payDraftSwitch.backgroundColor = UIColor.whiteColor; _depositSwitch.backgroundColor = UIColor.whiteColor; _payingDeposit = TRUE; canContinue = TRUE; }
    
        }
        
        if((_payFullSwitch.isOn && _payDraftSwitch.isOn) || (_payFullSwitch.isOn && _depositSwitch.isOn) || (_payDraftSwitch.isOn && _depositSwitch.isOn)){ _noSelectedPayment = TRUE; canContinue = FALSE;
            if(!(_errorLabel2.text.length > 0)){ _errorLabel2.text = _twoSelectedPaymentString; } [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0,0) animated:YES]; _errorLabelFade = @"ErrorLabel2"; [self startFade:nil]; }
        
        if(!_payFullSwitch.isOn && !_payDraftSwitch.isOn && !_depositSwitch.isOn){ _noSelectedPayment = TRUE; canContinue = FALSE; _payFullSwitch.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _payFullSwitch.layer.cornerRadius = 16.0; _payDraftSwitch.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _payDraftSwitch.layer.cornerRadius = 16.0; _errorLabel2.text = _noSelectedPaymentString; _depositSwitch.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _depositSwitch.layer.cornerRadius = 16.0; [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0,0) animated:YES]; _errorLabelFade = @"ErrorLabel2"; [self startFade:nil]; }
        
    } else {
        
        if(_payFullSwitch.isOn || _payDraftSwitch.isOn){ _noSelectedPayment = FALSE; _errorLabel2.text = @""; if(_emptyFields == FALSE){ canContinue = TRUE; } }
        
        if(_payFullSwitch.isOn){
            if(_payDraftSwitch.isOn == TRUE){  } else {
                _payFullSwitch.backgroundColor = UIColor.whiteColor; _payDraftSwitch.backgroundColor = UIColor.whiteColor; _payingFull = TRUE; canContinue = TRUE; }
        }
        
        if(_payDraftSwitch.isOn){
            if(_payFullSwitch.isOn == TRUE){  } else {
                _payFullSwitch.backgroundColor = UIColor.whiteColor; _payDraftSwitch.backgroundColor = UIColor.whiteColor; _payingDraft = TRUE; canContinue = TRUE; }
        }
        
        if(_payFullSwitch.isOn && _payDraftSwitch.isOn){ _noSelectedPayment = TRUE; canContinue = FALSE;
            if(!(_errorLabel2.text.length > 0)){ _errorLabel2.text = _twoSelectedPaymentString; } [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0,0) animated:YES]; _errorLabelFade = @"ErrorLabel2"; [self startFade:nil]; }
        
        if(!_payFullSwitch.isOn && !_payDraftSwitch.isOn){ _noSelectedPayment = TRUE; canContinue = FALSE; _payFullSwitch.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _payFullSwitch.layer.cornerRadius = 16.0; _payDraftSwitch.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _payDraftSwitch.layer.cornerRadius = 16.0; _errorLabel2.text = _noSelectedPaymentString; [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0,0) animated:YES]; _errorLabelFade = @"ErrorLabel2"; [self startFade:nil]; }
        
    }
    
    
    // Checks all the text fields.
    // Turns them red if they are not filled
    if(!studentNameField.hasText){ studentNameField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _studentNameFilled = FALSE; }
    
    if(!_parentNameField.hasText){ _parentNameField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _parentNameFilled = FALSE; }
    
    if(!_emailField.hasText){ _emailField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _emailFilled = FALSE; }
    
    if(!_dayField.hasText){ _dayField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _dayFilled = FALSE; }
    
    if(!_timeField.hasText){ _timeField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _timeFilled = FALSE; }
    
    if(!_numLessonsField.hasText){ _numLessonsField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _numOfLessonsFilled = FALSE; }
    
    if(!_phoneNumberField.hasText){ _phoneNumberField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _phoneNumberFilled = FALSE; }
    
    if(!_instructorNameField.hasText){ _instructorNameField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _instructorNameFilled = FALSE; }
    
    // Once corrected, change the background color back to white
    if(studentNameField.hasText){ studentNameField.backgroundColor = UIColor.whiteColor; _studentNameFilled = TRUE; }
    if(_parentNameField.hasText){ _parentNameField.backgroundColor = UIColor.whiteColor; _parentNameFilled = TRUE; }
    if(_emailField.hasText ){ _emailField.backgroundColor = UIColor.whiteColor; _emailFilled = TRUE; }
    if(_dayField.hasText){ _dayField.backgroundColor = UIColor.whiteColor; _dayFilled = TRUE; }
    if(_timeField.hasText){ _timeField.backgroundColor = UIColor.whiteColor; _timeFilled = TRUE; }
    if(_numLessonsField.hasText){ _numLessonsField.backgroundColor = UIColor.whiteColor; _numOfLessonsFilled = TRUE; }
    if(_phoneNumberField.hasText){ _phoneNumberField.backgroundColor = UIColor.whiteColor; _phoneNumberFilled = TRUE; }
    if(_instructorNameField.hasText){ _instructorNameField.backgroundColor = UIColor.whiteColor; _instructorNameFilled = TRUE; }
    
    NSLog(@"CE %@ \n %@", _confirmEmailField.text, _emailField.text);
    
    NSString *email = _emailField.text;
    NSString *email1 = _confirmEmailField.text;
    
    // Checks to make sure emails equal each other
    if([_confirmEmailField.text isEqualToString:_emailField.text]){
        
        canContinue = TRUE;
        
    } else {
        
        // Turns email fields red to tell user they dont match
        canContinue = FALSE;
        _confirmEmailField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1];
        _emailField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1];

        
    }
    
    // Continues checking fields
    if(_studentNameFilled == FALSE || _parentNameFilled == FALSE || _emailFilled == FALSE || _dayFilled == FALSE || _timeFilled == FALSE || _numOfLessonsFilled == FALSE || _phoneNumberFilled == FALSE || _instructorNameFilled == FALSE){ _errorLabel.text = _emptyFieldString; [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        _emptyFields = TRUE; _errorLabelFade = @"ErrorLabel"; [self startFade:nil]; }
    
    if(_studentNameFilled == TRUE && _parentNameFilled ==
       TRUE && _emailFilled == TRUE && _dayFilled == TRUE && _timeFilled == TRUE && _numOfLessonsFilled == TRUE && _phoneNumberFilled == TRUE && _instructorNameFilled == TRUE){  _errorLabel.text = @""; _emptyFields = FALSE;}
    
    NSString *lessonsString = _numLessonsField.text;
    
    // Makes sure the lessons and phone number have a number in them
    if(!([lessonsString rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)){ _doesLessonsHasNum = FALSE; _errorLabel1.text = @"*Please enter a number for the number of lessons.*"; _errorLabelFade = @"ErrorLabel1"; [self startFade:nil]; _numLessonsField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0,0) animated:YES];
    
    } else { _doesLessonsHasNum = TRUE; _errorLabel1.text = @""; _numLessonsField.backgroundColor = UIColor.whiteColor; }
    
    if(!([_phoneNumberField.text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)){ _doesPhoneHasNum = FALSE; _phoneNumberField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; if(!(_errorLabel2.text.length > 0)){ _errorLabel2.text = @"*Please enter a number for your phone number.*"; _errorLabelFade = @"ErrorLabel2"; [self startFade:nil]; } } else { _doesPhoneHasNum = TRUE; /*_errorLabel2.text = @"";*/ _phoneNumberField.backgroundColor = UIColor.whiteColor; }
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-YYYY"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Eastern Daylight Time"]];
    _dateString = [dateFormatter stringFromDate:_datePicker.date];
    NSLog(@"CHOSEN: %@", _dateString);
    
    NSDate *today = [NSDate date];
    NSString *todayDate = [dateFormatter stringFromDate:today];
    
    NSLog(@"TODAY: %@", todayDate);
    
    if(canContinue == TRUE && _emptyFields == FALSE && _doesLessonsHasNum == TRUE && _doesPhoneHasNum == TRUE && _noSelectedPayment == FALSE){
        
        _confirmEmailField.backgroundColor = UIColor.whiteColor;
        _emailField.backgroundColor = UIColor.whiteColor;
        
        if(_changeInfoBool == TRUE){ [self performSegueWithIdentifier:@"passSegue4" sender:sender]; }
        
        NSLog(@"%@", studentNameField.text);
        
        if(_changeInfo1 == FALSE){
            
            [self performSegueWithIdentifier:@"passSegue" sender:sender];
            
        } else {
            
            [self performSegueWithIdentifier:@"passSegue4" sender:sender];
            
        }
        
        if(!second){ second = [[SecondViewController alloc] initWithNibName:nil bundle:nil]; }
        self.secondView = second;
        
    } else { if(_confirmEmailField.text != _emailField.text){ } else { [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0,0) animated:YES]; } }
    
}

// Segues onto next view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"passSegue"]){
        SecondViewController *controller = (SecondViewController *)segue.destinationViewController;
        
        if(_changeInfoBool == TRUE){ controller.changeInfoBool1 = YES; controller.signatureScreenshotSave1 = _signatureScreenshotSave; }
        if(_newsletterSwitch.on){ _newsletterYN = TRUE; controller.newsletterYN = TRUE; } else { _newsletterYN = FALSE; controller.newsletterYN = FALSE; }
        
        NSLog(@"NEWSLETTER: %i", _newsletterYN);
        
        //controller._017SpringChoice = __017SpringChosen1;
        //controller._017SummerChoice = __017SummerChosen1;
        controller._017FallChoice = __017FallChosen1;
        controller.textParagraph11 = _textParagraph1;
        controller.textParagraph21 = _textParagraph2;
        controller.textParagraph31 = _textParagraph3;
        controller.payFullTrue = _payingFull;
        controller.payDraftTrue = _payingDraft;
        controller.payDepositTrue = _payingDeposit;
        controller.studentNameString = studentNameField.text;
        controller.parentNameString = _parentNameField.text;
        controller.emailString = _emailField.text;
        controller.dayString = _dayField.text;
        controller.timeString = _timeField.text;
        controller.numLessonsString = _numLessonsField.text;
        controller.dateString = _dateString;
        controller.contractScreenshot1 = _contractScreenshot;
        controller.phoneNumber1 = _phoneNumberField.text;
        controller.instructorName1 = _instructorNameField.text;

    }
    
    if([segue.identifier isEqualToString:@"passSegue4"]){
        
        ThirdViewController *controller1 = (ThirdViewController *)segue.destinationViewController;
        
        if(_payFullSwitch.isOn == TRUE){ controller1.payFullTrue1 = TRUE; controller1.paymentString1 = @"Paying in Full.";}
        if(_payDraftSwitch.isOn == TRUE){ controller1.payDraftTrue1 = TRUE; controller1.paymentString1 = @"Paying with a Draft."; }
        if(_depositSwitch.isOn == TRUE){ controller1.payDepositTrue1 = TRUE; controller1.paymentString1 = @"Paying with a Deposit."; }
        if(_newsletterSwitch.isOn == TRUE){ controller1.newsletterYN = TRUE; }
        if(_newsletterSwitch.isOn == FALSE){ controller1.newsletterYN = FALSE; }
        //controller1._017SpringChoice = __017SpringChosen1;
        controller1._017FallChoice = __017FallChosen1;
        controller1.studentNameString1 = studentNameField.text;
        controller1.parentNameString1 = _parentNameField.text;
        controller1.emailString1 = _emailField.text;
        controller1.dayString1 = _dayField.text;
        controller1.timeString1 = _timeField.text;
        controller1.numLessonsString1 = _numLessonsField.text;
        controller1.phoneNumber2 = _phoneNumberField.text;
        controller1.instructorName2 = _instructorNameField.text;
        controller1.dateString1 = _dateString;
        controller1.signatureScreenshot1 = _signatureScreenshotSave;
        
        if(_changeInfo1 == TRUE){ controller1.changeInfoBool = TRUE; }
        
        if(_payingFull == TRUE){ controller1.payFullTrue1 = TRUE; controller1.payDraftTrue1 = FALSE; }
        if(_payingDraft == TRUE){ controller1.payDraftTrue1 = TRUE; controller1.payFullTrue1 = FALSE; }
        
    }
    
}

// Called when the date needs to be changed
-(IBAction)changeDate:(id)sender{
    
    [_hiddenDateLabel removeFromSuperview];
    [_hiddenDateChangeButton removeFromSuperview];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-YYYY"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Eastern Daylight Time"]];
    
    CGRect datePickerFrame = CGRectMake(378, 1472, 357, 161);
    _datePicker = [[UIDatePicker alloc] initWithFrame:datePickerFrame];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    [self.scrollView addSubview:_datePicker];
    
}

-(void) viewDidDisappear:(BOOL)animated{
    
    NSLog(@"disappear");
    
    _changeInfo1 = FALSE;
    
    dateFormatter = nil;
    tapGesture = nil;
    //_datePicker = nil;
    second = nil;
    
}

// Goes back to info
-(IBAction)unwindToGameView:(UIStoryboardSegue *) gameSegue{
    
    [_datePicker removeFromSuperview];
    [_backButton removeFromSuperview];
    
    _changeSigButton.alpha = 1;
    _changeInfo1 = TRUE;
    
    _hiddenDateLabel.alpha = 1;
    _hiddenDateLabel.text = _dateString2;
    _hiddenDateChangeButton.alpha = 1;
    
    //_changeInfoBool = TRUE;
    
}

- (BOOL)shouldAutorotate{
    
    return YES;

}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
        
@end
