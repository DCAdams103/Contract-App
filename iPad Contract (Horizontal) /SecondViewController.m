//
//  SecondViewController.m
//  iPadTest2
//
//  Created by Dylan Adams on 6/10/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import "SecondViewController.h"
#import "GameViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
//@synthesize thirdView;

- (void)viewDidLoad {
    [super viewDidLoad];
        
}

-(void) viewWillAppear:(BOOL)animated{
    
    canContinue = TRUE;
    
    _signatureView.backgroundColor = [UIColor colorWithRed:236.0/255 green:236.0/255 blue:236.0/255 alpha:1];
    
    /*if(__017SummerChoice == TRUE){
        
        self.Paragraph.text = @"By signing below, I agree to the tuition terms set forth above.";
        
    } else { */
        
        self.Paragraph.text = @"By signing below, I agree to the tuition terms set forth above.  A signed Draft Authorization Form and a voided check (if “Monthly Draft” is the chosen method of payment) must accompany this agreement.";
        
    //}
    
}

// Segue for back button
-(IBAction)backMethod:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *) segue{
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"passSegue1"]){
        __weak ThirdViewController *controller = (ThirdViewController *)segue.destinationViewController;
        
        if(!controller.textParagraph12){ controller.textParagraph12 = _textParagraph11; }
        if(!controller.textParagraph22){ controller.textParagraph22 = _textParagraph21; }
        if(!controller.textParagraph32){ controller.textParagraph32 = _textParagraph31; }
        
        if(_payFullTrue == TRUE){ if(!controller.payFullTrue1 || !controller.payDraftTrue1 || !controller.payDepositTrue1){ controller.payFullTrue1 = TRUE; controller.payDraftTrue1 = FALSE; controller.payDepositTrue1 = FALSE; } }
        
        if(_payDraftTrue == TRUE){ if(!controller.payDraftTrue1 || !controller.payFullTrue1 || !controller.payDepositTrue1){ controller.payDraftTrue1 = TRUE; controller.payFullTrue1 = FALSE; controller.payDepositTrue1 = FALSE; } }
        
        if(_payDepositTrue == TRUE){ if(!controller.payDepositTrue1 || !controller.payFullTrue1 || !controller.payDraftTrue1){ controller.payDepositTrue1 = TRUE; controller.payFullTrue1 = FALSE; controller.payDraftTrue1 = FALSE; } }
        
        //if(!controller._017SpringChoice){ controller._017SpringChoice = __017SpringChoice; }
        //if(!controller._017SummerChoice){ controller._017SummerChoice = __017SummerChoice; }
        if(!controller.studentNameString1){ controller.studentNameString1 = _studentNameString; }
        if(!controller.parentNameString1){ controller.parentNameString1 = _parentNameString; }
        if(!controller.emailString1){ controller.emailString1 = _emailString; }
        if(!controller.dayString1){ controller.dayString1 = _dayString; }
        if(!controller.timeString1){ controller.timeString1 = _timeString; }
        if(!controller.numLessonsString1){ controller.numLessonsString1 = _numLessonsString; }
        if(!controller.dateString1){ controller.dateString1 = _dateString; }
        if(!controller.signatureScreenshot1){ controller.signatureScreenshot1 = _signature_screenshot; }
        if(!controller.contractScreenshot2){ controller.contractScreenshot2 = _contractScreenshot1; }
        if(!controller.phoneNumber2){ controller.phoneNumber2 = _phoneNumber1; }
        if(!controller.instructorName2){ controller.instructorName2 = _instructorName1; }
        if(!controller.newsletterYN){ controller.newsletterYN = _newsletterYN; }
        
    }
    
}

// Clears the signature box
-(IBAction)clearMethod:(id)sender{
    
    [_signatureView clearPath];
    
}

// Continue to next view if possible
-(IBAction)continueMethod:(id)sender{
        
    if(canContinue == TRUE){
        
        UIGraphicsBeginImageContext(CGSizeMake(self.signatureView.frame.size.width,self.signatureView.frame.size.height));
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.signatureView.layer renderInContext:context];
        _signature_screenshot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        /*if(__017SummerChoice == TRUE){
            
            [self performSegueWithIdentifier:@"SummerEnd2017" sender:sender];
            
        } else {*/
            
            [self performSegueWithIdentifier:@"passSegue1" sender:sender];

            
        //}
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
