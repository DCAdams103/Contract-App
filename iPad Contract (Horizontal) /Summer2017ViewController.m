//
////  GameViewController.m
////  iPadTest2
////
////  Created by Dylan Adams on 6/10/16.
////  Copyright (c) 2016 Dylan Adams. All rights reserved.
////
//
//#import "Summer2017ViewController.h"
//
//#import <mach/mach.h>
//
//@class SlideShowViewController;
//@implementation Summer2017Viewcontroller
//@synthesize secondView;
//@synthesize studentNameField;
//
//- (void)viewDidLoad{
//    
//    _changeSigButton.alpha = 0;
//    _hiddenDateLabel.alpha = 0;
//    _hiddenDateChangeButton.alpha = 0;
//    //_backButton.alpha = 0;
//    
//}
//
//-(void) viewDidAppear:(BOOL)animated{
//    
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents *comps = [[NSDateComponents alloc] init];
//    [comps setYear:-30];
//    NSDate *maxDate = [gregorian dateByAddingComponents:comps toDate:[NSDate date]  options:0];
//    
//    _canGoBack = FALSE;
//    
//    _canSwitchViews = TRUE;
//    
//    _scrollView.delegate = self;
//    
//    [_datePicker setMinimumDate:[NSDate date]];
//    [_datePicker setMaximumDate:maxDate];
//    
//    _emptyFieldString = @"*There is one or more empty Text Field*";
//    
//    
//    
//    if(_changeInfoBool == TRUE){
//        
//        studentNameField.text = _studentNameString;
//        _emailField.text = _emailString;
//        _confirmEmailField.text = _emailString;
//        _dayField.text = _dayString;
//        _timeField.text = _timeString;
//        _phoneNumberField.text = _phoneNumberString;
//        _instructorNameField.text = _instructorNameString;
//        
//        [_datePicker removeFromSuperview];
//        
//        _hiddenDateLabel.alpha = 1;
//        _hiddenDateChangeButton.alpha = 1;
//        
//        _hiddenDateLabel.text = _dateString2;
//        
//    }
//    
//    [super viewDidLoad];
//    
//    GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//    
//    //goBack = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(goBackMethod) userInfo:nil repeats:NO];
//    
//}
//
//-(IBAction)changeSig:(id)sender{
//    
//    if(_changeInfo1 == TRUE){
//        
//        [self performSegueWithIdentifier:@"passSegue" sender:sender];
//        
//    }
//    
//}
//
//-(void) goBackMethod{
//    
//    _canGoBack = TRUE;
//    _backButton.alpha = 1;
//    
//}
//
//-(IBAction)goBack:(id)sender{
//    
//    if(_canSwitchViews == TRUE && _canGoBack == TRUE){
//        
//        [self performSegueWithIdentifier:@"backToSlideshowUnwind" sender:self];
//        //[self dismissViewControllerAnimated:YES completion:nil];
//        
//    }
//}
//
//-(IBAction)returnKeyButton:(id)sender{
//    
//    if(studentNameField.isFirstResponder){ [sender resignFirstResponder]; [_emailField becomeFirstResponder]; } else if(_emailField.isFirstResponder){
//        [sender resignFirstResponder];
//        [_confirmEmailField becomeFirstResponder]; } else if(_confirmEmailField.isFirstResponder){
//            [sender resignFirstResponder];
//            [_phoneNumberField becomeFirstResponder]; } else if (_phoneNumberField.isFirstResponder){ [sender resignFirstResponder]; [_dayField becomeFirstResponder]; } else if(_dayField.isFirstResponder){
//                [sender resignFirstResponder];
//                [_timeField becomeFirstResponder]; } else if(_timeField.isFirstResponder){
//                    [sender resignFirstResponder]; [_instructorNameField becomeFirstResponder]; }
//    
//}
//
//- (void)registerForKeyboardNotifications {
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWasShown:)
//                                                 name:UIKeyboardDidShowNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillBeHidden:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
//    
//}
//
//- (void)deregisterFromKeyboardNotifications {
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardDidHideNotification
//                                                  object:nil];
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillHideNotification
//                                                  object:nil];
//    
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    
//    [super viewWillAppear:animated];
//    
//    [self registerForKeyboardNotifications];
//    
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    
//    [self deregisterFromKeyboardNotifications];
//    
//    [super viewWillDisappear:animated];
//    
//}
//
//- (void)keyboardWasShown:(NSNotification *)notification {
//    
//    NSDictionary* info = [notification userInfo];
//    
//    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    CGPoint datePickerOrigin = CGPointMake(376, 1100);
//    
//    NSLog(@"%@", NSStringFromCGPoint(datePickerOrigin));
//    
//    CGFloat datePickerHeight = 161;
//    
//    NSLog(@"%f", datePickerHeight);
//    
//    CGRect visibleRect = self.view.frame;
//    
//    visibleRect.size.height -= keyboardSize.height;
//    bottomOfScreen = CGPointMake(0.0, datePickerOrigin.y - visibleRect.size.height + datePickerHeight - 210);
//    
//    if (!CGRectContainsPoint(visibleRect, datePickerOrigin)){
//        
//        scrollPoint = CGPointMake(0.0, datePickerOrigin.y - visibleRect.size.height + datePickerHeight - 20);
//        [self.scrollView setContentOffset:scrollPoint animated:YES];
//        
//    }
//    
//}
//
//- (void)keyboardWillBeHidden:(NSNotification *)notification {
//    
//    NSLog(@"hi");
//    [self.scrollView setContentOffset:bottomOfScreen animated:YES];
//    
//}
//
//-(IBAction)startFade:(id)sender{
//    
//    if([_errorLabelFade isEqualToString:@"ErrorLabel"]){
//        
//        _errorLabel.layer.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1].CGColor;
//        
//        [UIView animateWithDuration:2.0 animations:^{
//            _errorLabel.layer.backgroundColor = [UIColor whiteColor].CGColor;
//        } completion:NULL];
//        
//    }
//    
//    if ([_errorLabelFade isEqualToString:@"ErrorLabel1"]){
//        
//        _errorLabel1.layer.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1].CGColor;
//        
//        [UIView animateWithDuration:2.0 animations:^{
//            _errorLabel1.layer.backgroundColor = [UIColor whiteColor].CGColor;
//        } completion:NULL];
//        
//    }
//    
//    if ([_errorLabelFade isEqualToString:@"ErrorLabel2"]){
//        
//        _errorLabel2.layer.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1].CGColor;
//        
//        [UIView animateWithDuration:2.0 animations:^{
//            _errorLabel2.layer.backgroundColor = [UIColor whiteColor].CGColor;
//        } completion:NULL];
//        
//    }
//    
//}
//
//-(IBAction)continueMethod:(id)sender{
//    
//    if(!studentNameField.hasText){ studentNameField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _studentNameFilled = FALSE; }
//    
//    if(!_emailField.hasText){ _emailField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _emailFilled = FALSE; }
//    
//    if(!_confirmEmailField.hasText){ _emailField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255  blue:87.0/255 alpha:1]; _confirmEmailFilled = FALSE; }
//    
//    if(!_dayField.hasText){ _dayField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _dayFilled = FALSE; }
//    
//    if(!_timeField.hasText){ _timeField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _timeFilled = FALSE; }
//    
//    if(!_phoneNumberField.hasText){ _phoneNumberField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _phoneNumberFilled = FALSE; }
//    
//    if(!_instructorNameField.hasText){ _instructorNameField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; _instructorNameFilled = FALSE; }
//    
//    if(studentNameField.hasText){ studentNameField.backgroundColor = UIColor.whiteColor; _studentNameFilled = TRUE; }
//    if(_emailField.hasText ){ _emailField.backgroundColor = UIColor.whiteColor; _emailFilled = TRUE; }
//    if(_confirmEmailField.hasText){ _confirmEmailField.backgroundColor = UIColor.whiteColor; _confirmEmailFilled = TRUE; }
//    if(_dayField.hasText){ _dayField.backgroundColor = UIColor.whiteColor; _dayFilled = TRUE; }
//    if(_timeField.hasText){ _timeField.backgroundColor = UIColor.whiteColor; _timeFilled = TRUE; }
//    if(_phoneNumberField.hasText){ _phoneNumberField.backgroundColor = UIColor.whiteColor; _phoneNumberFilled = TRUE; }
//    if(_instructorNameField.hasText){ _instructorNameField.backgroundColor = UIColor.whiteColor; _instructorNameFilled = TRUE; }
//    
//    if([_confirmEmailField.text isEqualToString:_emailField.text]){
//        
//        _confirmEmailMatch = TRUE;
//        
//    } else {
//        
//        _confirmEmailMatch = FALSE;
//        _confirmEmailField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1];
//        _emailField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1];
//        
//        
//    }
//    
//    if(_studentNameFilled == FALSE || _emailFilled == FALSE || _confirmEmailFilled == FALSE || _dayFilled == FALSE || _timeFilled == FALSE || _phoneNumberFilled == FALSE || _instructorNameFilled == FALSE){ _errorLabel.text = _emptyFieldString; [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//        _emptyFields = TRUE; _errorLabelFade = @"ErrorLabel"; [self startFade:nil]; }
//    
//    if(_studentNameFilled == TRUE &&  _emailFilled == TRUE && _confirmEmailFilled == TRUE && _dayFilled == TRUE && _timeFilled == TRUE && _phoneNumberFilled == TRUE && _instructorNameFilled == TRUE){  _errorLabel.text = @""; _emptyFields = FALSE;}
//    
//    if(!([_phoneNumberField.text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)){ _doesPhoneHasNum = FALSE; _phoneNumberField.backgroundColor = [UIColor colorWithRed:238.0/255 green:93.0/255 blue:87.0/255 alpha:1]; if(!(_errorLabel2.text.length > 0)){ _errorLabel2.text = @"*Please enter a number for your phone number.*"; _errorLabelFade = @"ErrorLabel2"; [self startFade:nil]; } } else { _doesPhoneHasNum = TRUE; /*_errorLabel2.text = @"";*/ _phoneNumberField.backgroundColor = UIColor.whiteColor; }
//    
//    dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"MM-dd-YYYY"];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Eastern Daylight Time"]];
//    _dateString = [dateFormatter stringFromDate:_datePicker.date];
//    NSLog(@"CHOSEN: %@", _dateString);
//    
//    NSDate *today = [NSDate date];
//    NSString *todayDate = [dateFormatter stringFromDate:today];
//    
//    NSLog(@"TODAY: %@", todayDate);
//    
//    NSLog(@"CC: %d EF: %d dPHN: %d cEM: %d", canContinue, _emptyFields, _doesPhoneHasNum, _confirmEmailMatch);
//    
//    if(_emptyFields == FALSE && _doesPhoneHasNum == TRUE && _confirmEmailMatch == TRUE){
//        
//        _confirmEmailField.backgroundColor = UIColor.whiteColor;
//        _emailField.backgroundColor = UIColor.whiteColor;
//        
//        //if(_changeInfoBool == TRUE){ [self performSegueWithIdentifier:@"passSegue4Summer" sender:sender]; }
//        
//        NSLog(@"%@", studentNameField.text);
//        
//        if(_changeInfo1 == FALSE){
//            
//            [self performSegueWithIdentifier:@"passSegueSummer" sender:sender];
//            
//        } else {
//            
//            [self performSegueWithIdentifier:@"passSegue4Summer" sender:sender];
//            
//        }
//        
//        if(!second){ second = [[SecondViewController alloc] initWithNibName:nil bundle:nil]; }
//        self.secondView = second;
//        
//    } else { if(_confirmEmailField.text != _emailField.text){ } else { [self.view endEditing:YES]; [_scrollView setContentOffset:CGPointMake(0,0) animated:YES]; } }
//    
//}
//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"passSegueSummer"]){
//        SecondViewController *controller = (SecondViewController *)segue.destinationViewController;
//        
//        if(_changeInfoBool == TRUE){ controller.changeInfoBool1 = YES; controller.signatureScreenshotSave1 = _signatureScreenshotSave; }
//        if(_newsletterSwitch.on){ _newsletterYN = TRUE; controller.newsletterYN = TRUE; } else { _newsletterYN = FALSE; controller.newsletterYN = FALSE; }
//        
//        NSLog(@"NEWSLETTER: %i", _newsletterYN);
//        
//        //controller._017SpringChoice = __017SpringChosen1;
//        controller._017SummerChoice = __017SummerChosen1;
//        controller.textParagraph11 = _textParagraph1;
//        controller.textParagraph21 = _textParagraph2;
//        controller.textParagraph31 = _textParagraph3;
//        controller.payFullTrue = _payingFull;
//        controller.payDraftTrue = _payingDraft;
//        controller.payDepositTrue = _payingDeposit;
//        controller.studentNameString = studentNameField.text;
//        controller.emailString = _emailField.text;
//        controller.dayString = _dayField.text;
//        controller.timeString = _timeField.text;
//        controller.dateString = _dateString;
//        controller.contractScreenshot1 = _contractScreenshot;
//        controller.phoneNumber1 = _phoneNumberField.text;
//        controller.instructorName1 = _instructorNameField.text;
//        
//    }
//    
//    if([segue.identifier isEqualToString:@"passSegue4Summer"]){
//        
//        ThirdViewController *controller1 = (ThirdViewController *)segue.destinationViewController;
//        
//        if(_newsletterSwitch.isOn == TRUE){ controller1.newsletterYN = TRUE; }
//        if(_newsletterSwitch.isOn == FALSE){ controller1.newsletterYN = FALSE; }
//        //controller1._017SpringChoice = __017SpringChosen1;
//        controller1._017SummerChoice = __017SummerChosen1;
//        controller1.studentNameString1 = studentNameField.text;
//        controller1.emailString1 = _emailField.text;
//        controller1.dayString1 = _dayField.text;
//        controller1.timeString1 = _timeField.text;
//        controller1.phoneNumber2 = _phoneNumberField.text;
//        controller1.instructorName2 = _instructorNameField.text;
//        controller1.dateString1 = _dateString;
//        controller1.signatureScreenshot1 = _signatureScreenshotSave;
//        
//        if(_changeInfo1 == TRUE){ controller1.changeInfoBool = TRUE; }
//        
//    }
//    
//}
//
//-(IBAction)changeDate:(id)sender{
//    
//    [_hiddenDateLabel removeFromSuperview];
//    [_hiddenDateChangeButton removeFromSuperview];
//    
//    dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"MM-dd-YYYY"];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Eastern Daylight Time"]];
//    
//    CGRect datePickerFrame = CGRectMake(378, 1196, 357, 161);
//    _datePicker = [[UIDatePicker alloc] initWithFrame:datePickerFrame];
//    _datePicker.datePickerMode = UIDatePickerModeDate;
//    [self.scrollView addSubview:_datePicker];
//    
//}
//
//-(void) viewDidDisappear:(BOOL)animated{
//    
//    NSLog(@"disappear");
//        
//    _changeInfo1 = FALSE;
//    
//    dateFormatter = nil;
//    tapGesture = nil;
//    //_datePicker = nil;
//    second = nil;
//    
//}
//
//-(IBAction)unwindToGameView:(UIStoryboardSegue *) gameSegue{
//    
//    [_datePicker removeFromSuperview];
//    [_backButton removeFromSuperview];
//    
//    _changeSigButton.alpha = 1;
//    _changeInfo1 = TRUE;
//    
//    _hiddenDateLabel.alpha = 1;
//    _hiddenDateLabel.text = _dateString2;
//    _hiddenDateChangeButton.alpha = 1;
//    
//    //_changeInfoBool = TRUE;
//    
//}
//
//- (BOOL)shouldAutorotate{
//    
//    return YES;
//    
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return UIInterfaceOrientationMaskAllButUpsideDown;
//    } else {
//        return UIInterfaceOrientationMaskAll;
//    }
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    
//}
//
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}
//
//@end
