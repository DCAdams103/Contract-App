//
//  ChoiceViewController.m
//  Contract
//
//  Created by Dylan Adams on 11/1/16.
//  Copyright © 2016 Dylan Adams. All rights reserved.
//

#import "ChoiceViewController.h"
#import "GameViewController.h"
//#import "Summer2017ViewController.h"

@interface ChoiceViewController ()

@end

@implementation ChoiceViewController

//-(IBAction)goToSummer2017:(id)sender{
//    
//    //__017SpringChosen = FALSE;
//    __017SummerChosen = TRUE;
//    __017FallChosen = FALSE;
//    NSLog(@"%d", __017SummerChosen);
//    [self performSegueWithIdentifier:@"2017SummerSegue" sender:sender];
//    
//}

//-(IBAction)goToSpring2017:(id)sender{
//    
//    __017SpringChosen = TRUE;
//    __017SummerChosen = FALSE;
//    __017FallChosen = FALSE;
//    NSLog(@"%d", __017SpringChosen);
//    [self performSegueWithIdentifier:@"2017SpringSegue" sender:sender];
//    
//}

-(IBAction)goToFall2017:(id)sender{

    //__017SpringChosen = FALSE;
    //__017SummerChosen = FALSE;
    __017FallChosen = TRUE;
    NSLog(@"%d", __017FallChosen);
    [self performSegueWithIdentifier:@"2017FallSegue" sender:sender];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    GameViewController *controller = (GameViewController *)segue.destinationViewController;
    //Summer2017Viewcontroller *controller1 = (Summer2017Viewcontroller *)segue.destinationViewController;
    
//    if([segue.identifier isEqualToString:@"2017SummerSegue"]){
//        
//        //controller1._017SpringChosen1 = __017SummerChosen;
//        //controller1._017SummerChosen1 = __017SummerChosen;
//        controller1._017FallChosen1 = __017FallChosen;
//        
//    }
    
//    if([segue.identifier isEqualToString:@"2017SpringSegue"]){
//        
//        controller._017SpringChosen1 = __017SpringChosen;
//        controller._017SummerChosen1 = __017SummerChosen;
//        controller._017FallChosen1 = __017FallChosen;
//
//        
//    }
    
    if([segue.identifier isEqualToString:@"2017FallSegue"]){
        
        //controller._017SpringChosen1 = __017SpringChosen;
        //controller._017SummerChosen1 = __017SummerChosen;
        controller._017FallChosen1 = __017FallChosen;
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
