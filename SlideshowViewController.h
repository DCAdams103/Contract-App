//
//  SlideShowViewController.h
//  Contract test
//
//  Created by Dylan Adams on 7/5/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DropboxSDK/DropboxSDK.h>

@interface SlideShowViewController : UIViewController <DBRestClientDelegate>{
    
    __weak NSString *imageName;
    __weak NSString *filePath, *documentsPath;
    BOOL first;
    __strong DBRestClient *restClient;
    __weak NSTimer *firstTimer, *mainTimer;
    int orderInt;
    
}

@property (nonatomic, weak) __weak IBOutlet UIImageView *slideShowImageView;

@end
