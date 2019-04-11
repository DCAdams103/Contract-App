//
//  ThirdViewController.h
//  iPadTest2
//
//  Created by Dylan Adams on 6/10/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <SpriteKit/SpriteKit.h>
#import <DropboxSDK/DropboxSDK.h>

@interface ThirdViewController : UIViewController <MFMailComposeViewControllerDelegate, DBRestClientDelegate> {
    
    NSString *fileName;
    NSString *destDir;
    BOOL matchedFolder;
    MFMailComposeViewController *picker;
    
}

@property (nonatomic, strong) DBRestClient *restClient;

//MFMailComposeViewControllerDelegate

-(IBAction)changeInfo:(id)sender;
-(IBAction)sendContract:(id)sender;

@property (nonatomic, weak) __weak IBOutlet UILabel *newsletterLabel;

@property (nonatomic, strong) IBOutlet UIScrollView *scroller;

@property (nonatomic, weak) __weak IBOutlet UILabel *studentNameLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *parentNameLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *paymentLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *dayLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *numOfLessonsLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *beginDateLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *reviewContractLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *phoneNumberLabel;
@property (nonatomic, weak) __weak IBOutlet UILabel *instructorNameLabel;
@property (nonatomic, weak) __weak IBOutlet UIButton *changeInfo;
@property (nonatomic, weak) __weak IBOutlet UIButton *sendCopy;
@property (nonatomic, weak) __weak IBOutlet UIButton *changeSig;

@property (nonatomic, weak) UITextView *textParagraph12;
@property (nonatomic, weak) UITextView *textParagraph22;
@property (nonatomic, weak) UITextView *textParagraph32;
@property (nonatomic, weak) __weak IBOutlet UIImageView *signatureView;
@property (nonatomic, weak) __weak IBOutlet UIImageView *signaturePicture;

@property (nonatomic, assign) BOOL payFullTrue1;
@property (nonatomic, assign) BOOL payDraftTrue1;
@property (nonatomic, assign) BOOL changeInfoBool;
@property (nonatomic, assign) BOOL changeSignatureBool;
@property (nonatomic, assign) BOOL addAttachment;
@property (nonatomic, assign) BOOL startOver;
@property (nonatomic, assign) BOOL newsletterYN;

@property (nonatomic, strong) NSString *paymentString1;
@property (nonatomic, strong) NSString *paymentString2;
@property (nonatomic, strong) NSString *studentNameString1;
@property (nonatomic, strong) NSString *parentNameString1;
@property (nonatomic, strong) NSString *emailString1;
@property (nonatomic, strong) NSString *dayString1;
@property (nonatomic, strong) NSString *timeString1;
@property (nonatomic, strong) NSString *numLessonsString1;
@property (nonatomic, strong) NSString *dateString1;
@property (nonatomic, strong) NSString *phoneNumber2;
@property (nonatomic, strong) NSString *instructorName2;

@property (nonatomic, strong) UIImage *signatureScreenshot1;
@property (nonnull, strong) UIImage *image;
@property (nonnull, strong) UIImage *image2;
@property (nonnull, strong) UIImageView *contractScreenshot2;

@property (nonnull, strong) NSMutableData* pdfData;
@property (nonnull, strong) NSData* myData;


@end
