//
//  ThirdViewController.m
//  iPadTest2
//
//  Created by Dylan Adams on 6/10/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import "ThirdViewController.h"
#import "GameViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize scroller;

// Loads everything once view loads
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _signaturePicture.backgroundColor = [UIColor colorWithRed:236.0/255 green:236.0/255 blue:236.0/255 alpha:1];
    
    _paymentString1 = @"Paying in Full.";
    _paymentString2 = @"Paying with a Draft.";
    _studentNameLabel.text = _studentNameString1;
    _parentNameLabel.text = _parentNameString1;
    _emailLabel.text = _emailString1;
    if(_payFullTrue1 == TRUE) { _paymentLabel.text = _paymentString1; } else if (_payDraftTrue1 == TRUE){ _paymentLabel.text = _paymentString2; }
    if(_newsletterYN == TRUE){ _newsletterLabel.text = @"Yes"; } else if (_newsletterYN == FALSE){ _newsletterLabel.text = @"No"; }
    _dayLabel.text = _dayString1;
    _timeLabel.text = _timeString1;
    _numOfLessonsLabel.text = _numLessonsString1;
    _beginDateLabel.text = _dateString1;
    _phoneNumberLabel.text = _phoneNumber2;
    _instructorNameLabel.text = _instructorName2;
    _signaturePicture.image = _signatureScreenshot1;
    
    CGRect contentRect = CGRectMake(0, 0, _image.size.width, _image.size.height);
    self.scroller.contentSize = contentRect.size;
    
    if(!self.restClient){ self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]]; }
    self.restClient.delegate = self;
    
}

-(void) viewDidAppear:(BOOL)animated{
    
    if(_changeInfoBool == TRUE){
        
        [_changeInfo removeFromSuperview];
        
    }
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if ([[DBSession sharedSession] handleOpenURL:url]) {
        if ([[DBSession sharedSession] isLinked]) {
            NSLog(@"App linked successfully!");
        }
        return YES;
    }
    return NO;
}

- (IBAction)didPressLink {
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return YES; // So that I can determine whether or not to perform the segue based on app logic
}

// Goes back to showing the slideshow
-(IBAction)startOverAction:(id)sender{
    
    [self performSegueWithIdentifier:@"backToSlideshowSegue" sender:self];
    
}

// Goes back to beginning, saving info to be changed
-(IBAction)changeInfo:(id)sender{
    
    _changeInfoBool = TRUE;
    [self performSegueWithIdentifier:@"gameViewSegue" sender:self];
    
}

// Makes the PDF based off data and signature
-(void) MakeAPDF{
    
    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(_image, 1)];
    
    _pdfData = [NSMutableData dataWithData:imageData];
    
    CGRect aRect = CGRectMake(0, 250, scroller.contentSize.width, scroller.contentSize.height);
    UIGraphicsBeginPDFContextToData(_pdfData, aRect, nil);
    UIGraphicsBeginPDFPage();
    
    [scroller.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIGraphicsEndPDFContext();
    
}

// Creates email
-(void) callMethods{
    
    if(_image == nil){
        
        NSLog(@"nil");
        
    }
    
    if ([MFMailComposeViewController canSendMail]){
        
        if(!picker){ picker = [[MFMailComposeViewController alloc] init]; }
        picker.mailComposeDelegate = self;
        [picker setSubject:@"Quarter Note Music Lesson Contract"];
        _myData = UIImageJPEGRepresentation(_image, 1);

        fileName = [NSString stringWithFormat:@"%@.jpg", _studentNameString1];
        
        [picker addAttachmentData:_myData mimeType:@"image/jpg" fileName:fileName];
        
        NSString *emailBody = @"";
        [picker setMessageBody:emailBody isHTML:NO];
        [picker setToRecipients:[NSArray arrayWithObject:_emailString1]];
        [picker setBccRecipients:[NSArray arrayWithObject:@"rusty@quarternotemusic.com"]];
        [picker setEditing:FALSE];
        [self presentViewController:picker animated:YES completion:nil];
        
    }
    
}

// If the user signed up for newsletters, put their email into a list on Dropbox
// Also sort them into the correct folder based on the instructor name inputted
-(void) writeFile{
    
    matchedFolder = FALSE;
        
    _myData = UIImageJPEGRepresentation(_image, 1);
    NSData *myData = _myData;
    
    fileName = [NSString stringWithFormat:@"%@ - %@.jpeg", _studentNameString1, _instructorName2];
    NSString *fileName1 = fileName;
    
    if(_newsletterYN == TRUE){
        
        destDir = @"/Emails for Newsletter/";
    
        NSString *text = [NSString stringWithFormat:@"%@ - %@", _studentNameString1, _emailString1];
        NSString *textFileName = [NSString stringWithFormat:@"%@.txt", _studentNameString1];
        NSString *localDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *localPath = [localDir stringByAppendingPathComponent:textFileName];
        [text writeToFile:localPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        [self.restClient uploadFile:textFileName toPath:destDir withParentRev:nil fromPath:localPath];
    
    }
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName1]; //Add the file name
    [myData writeToFile:filePath atomically:YES];
    
    destDir = @"";
    
    if([_instructorName2 containsString:@"Ryan"] || [_instructorName2 containsString:@"ryan"] || [_instructorName2 containsString:@"Ryan Raven"] || [_instructorName2 containsString:@"ryan raven"]){ destDir = [NSString stringWithFormat:@"/Ryan/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Christian"] || [_instructorName2 containsString:@"christian"] || [_instructorName2 containsString:@"Christian Manley"] || [_instructorName2 containsString:@"christian manley"]){ destDir = [NSString stringWithFormat:@"/Christian/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"John"] || [_instructorName2 containsString:@"john"] || [_instructorName2 containsString:@"John Orlando"] || [_instructorName2 containsString:@"john orlando"]){ destDir = [NSString stringWithFormat:@"/John/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Warren"] || [_instructorName2 containsString:@"warren"] || [_instructorName2 containsString:@"Warren Sharp"] || [_instructorName2 containsString:@"warren sharp"]){ destDir = [NSString stringWithFormat:@"/Warren/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Adam"] || [_instructorName2 containsString:@"adam"] || [_instructorName2 containsString:@"Adam Walker"] || [_instructorName2 containsString:@"adam walker"]){ destDir = [NSString stringWithFormat:@"/Adam/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Conner"] || [_instructorName2 containsString:@"conner"] || [_instructorName2 containsString:@"Conner Dixon"] || [_instructorName2 containsString:@"conner dixon"]){ destDir = [NSString stringWithFormat:@"/Conner/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Joelle"] || [_instructorName2 containsString:@"joelle"] || [_instructorName2 containsString:@"Joelle Hilton"] || [_instructorName2 containsString:@"joelle hilton"]){ destDir = [NSString stringWithFormat:@"/Joelle/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Jennifer"] || [_instructorName2 containsString:@"jennifer"] || [_instructorName2 containsString:@"Jennifer Capps"] || [_instructorName2 containsString:@"jennifer capps"]){ destDir = [NSString stringWithFormat:@"/Jennifer/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Autumn"] || [_instructorName2 containsString:@"autumn"] || [_instructorName2 containsString:@"Autumn Brand"] || [_instructorName2 containsString:@"autumn brand"]){ destDir = [NSString stringWithFormat:@"/Autumn/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Petia"] || [_instructorName2 containsString:@"petia"]){ destDir = [NSString stringWithFormat:@"/Petia/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Alexa"] || [_instructorName2 containsString:@"alexa"] || [_instructorName2 containsString:@"Alexa Hughes"] || [_instructorName2 containsString:@"alexa hughes"]){ destDir = [NSString stringWithFormat:@"/Alexa/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Christina"] || [_instructorName2 containsString:@"christina"] || [_instructorName2 containsString:@"Christina Starks"] || [_instructorName2 containsString:@"christina starks"]){ destDir = [NSString stringWithFormat:@"/Christina/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Andrea"] || [_instructorName2 containsString:@"andrea"] || [_instructorName2 containsString:@"Andrea Luke"] || [_instructorName2 containsString:@"andrea luke"]){ destDir = [NSString stringWithFormat:@"/Andrea/"]; matchedFolder = TRUE; }
    
    if([_instructorName2 containsString:@"Allison"] || [_instructorName2 containsString:@"allison"] || [_instructorName2 containsString:@"Allison Pia"] || [_instructorName2 containsString:@"allison pia"]){ destDir = [NSString stringWithFormat:@"/Allison/"]; matchedFolder = TRUE; }
    
    if(matchedFolder == FALSE){ destDir = @"/"; }
    
    [self.restClient uploadFile:fileName1 toPath:destDir withParentRev:nil fromPath:filePath];
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    if (error) {
        
        NSLog(@"Error with the Email.");
        
    } else {
        
        _startOver = TRUE;
        [self dismissViewControllerAnimated:YES completion:nil];
        [self startOverAction:nil];
        
    }
    
}

-(UIImage *)normalizeImage:(UIImage *)raw {
    if (raw.imageOrientation == UIImageOrientationUp) return raw;
    UIGraphicsBeginImageContextWithOptions(raw.size, NO, raw.scale);
    [raw drawInRect:(CGRect){0, 0, raw.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

// Sends the email
-(IBAction)sendContract:(id)sender{
    
    [_changeInfo removeFromSuperview];
    [_sendCopy removeFromSuperview];
    //[_changeSig removeFromSuperview];
    [_reviewContractLabel removeFromSuperview];
    
    _image2 = nil;
    
    UIGraphicsBeginImageContext(scroller.contentSize);
    {
        CGPoint savedContentOffset = scroller.contentOffset;
        CGRect savedFrame = scroller.frame;
        
        scroller.contentOffset = CGPointZero;
        scroller.frame = CGRectMake(0, 0, scroller.contentSize.width, scroller.contentSize.height);
        
        [scroller.layer renderInContext: UIGraphicsGetCurrentContext()];
        _image2 = UIGraphicsGetImageFromCurrentImageContext();
        
        scroller.contentOffset = savedContentOffset;
        scroller.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    CGRect rect = CGRectMake(0.0, 0.0, _image2.size.width, _image2.size.height - 107);
    CGImageRef tempImage = CGImageCreateWithImageInRect([_image2 CGImage], rect);
    UIImage *newImage = [UIImage imageWithCGImage:tempImage];
    CGImageRelease(tempImage);
    
    _image = newImage;
    
    if(newImage == nil){
        
        NSLog(@"NIL");
        _image = _image2;
        
    }
    
    [self writeFile];
    [self callMethods];
    
}

// Segues back to said view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"passSegue2"]){
        __weak GameViewController *controller = (GameViewController *)segue.destinationViewController;
        
        if(_startOver == FALSE){
            
            if(!controller.studentNameString){ controller.studentNameString = _studentNameString1; }
            if(!controller.parentNameString){ controller.parentNameString = _parentNameString1; }
            if(!controller.emailString){ controller.emailString = _emailString1; }
            if(!controller.dayString){ controller.dayString = _dayString1; }
            if(!controller.timeString){ controller.timeString = _timeString1; }
            if(!controller.numLessonsString){ controller.numLessonsString = _numLessonsString1; }
            if(!controller.changeInfoBool){ controller.changeInfoBool = TRUE; }
            if(!controller.signatureScreenshotSave){ controller.signatureScreenshotSave =  _signatureScreenshot1; }
            if(!controller.dateString2){ controller.dateString2 = _dateString1; }
            if(!controller.phoneNumberString){ controller.phoneNumberString = _phoneNumber2; }
            if(!controller.instructorNameString){ controller.instructorNameString = _instructorName2; }
            if(!controller.newsletterYN){ controller.newsletterYN = _newsletterYN; }
            
            if(_payFullTrue1 == TRUE){ if(!controller.turnPayFullOn || !controller.turnPayDraftOn){ controller.turnPayFullOn = TRUE; controller.turnPayDraftOn = FALSE; } }
            
            if(_payDraftTrue1 == TRUE){ if(!controller.turnPayDraftOn || !controller.turnPayFullOn){ controller.turnPayDraftOn = TRUE; controller.turnPayFullOn = FALSE; } }
            
        }
        
    }
    
    if([segue.identifier isEqualToString:@"passSegue3"]){
        
        __weak SecondViewController *controller1 = (SecondViewController *)segue.destinationViewController;
        
        if(!controller1.changeSignatureBool1){ controller1.changeSignatureBool1 = TRUE; }
        
        if(!controller1.studentNameString){ controller1.studentNameString = _studentNameLabel.text; }
        if(!controller1.parentNameString){ controller1.parentNameString = _parentNameLabel.text; }
        if(!controller1.emailString){ controller1.emailString = _emailLabel.text; }
        if(!controller1.dayString){ controller1.dayString = _dayLabel.text; }
        if(!controller1.timeString){ controller1.timeString = _timeLabel.text; }
        if(!controller1.numLessonsString){ controller1.numLessonsString = _numOfLessonsLabel.text; }
        if(!controller1.dateString){ controller1.dateString = _beginDateLabel.text; }
        if(!controller1.phoneNumber1){ controller1.phoneNumber1 = _phoneNumber2; }
        if(!controller1.instructorName1){ controller1.instructorName1 = _instructorName2; }
        if(!controller1.newsletterYN){ controller1.newsletterYN = _newsletterYN; }
        
        if(_payFullTrue1 == TRUE){ if(!controller1.payFullTrue || !controller1.payDraftTrue){ controller1.payFullTrue = TRUE; controller1.payDraftTrue = FALSE; }
            if(_payDraftTrue1 == TRUE){ controller1.payDraftTrue = TRUE; controller1.payFullTrue = FALSE; } }
        
    }
    
    if([segue.identifier isEqualToString:@"gameViewSegue"]){
        
        __weak GameViewController *controller = (GameViewController *)segue.destinationViewController;
        
        if(!controller.signatureScreenshotSave){ controller.signatureScreenshotSave =  _signatureScreenshot1; }
        
        controller.dateString2 = _dateString1;
                
    }
    
}

-(void) viewWillDisappear:(BOOL)animated{
    
    picker = nil;
    self.restClient = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
