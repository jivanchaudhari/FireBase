//
//  ViewController.m
//  JCfireBase
//
//  Created by Mac on 17/08/1938 Saka.
//  Copyright © 1938 Saka Jivan Chaudhari. All rights reserved.
//

#import "ViewController.h"

@import  Firebase;
@import  FirebaseDatabase;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    detail = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchData {
    
    [[[[FIRDatabase database]reference]child:@"texts"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        NSDictionary *dictionary = snapshot.value;
       
        if (detail.count > 0) {
            
            [detail removeAllObjects];
            
        }
        for (NSString *key in dictionary.allKeys) {
            NSDictionary *content = [dictionary valueForKey:key];
            
            NSLog(@"%@",content);
            
            
        }
        if (detail.count > 0) {
            
            //[self performSelectorOnMainThread:@selector(updateTbleView) withObject:nil waitUntilDone:NO];
            
        }
    }];
}


- (IBAction)actionSave:(id)sender {
    
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%f",time];
    
    NSDictionary *dictionary = @{
                                 @"data" : self.textName.text,
                                 @"time" : timeString
                                 
                                 };
    FIRDatabaseReference *refrences = [[[FIRDatabase database]reference]child:@"texts"];
    
    [refrences queryOrderedByChild:@"time"];
    
    [[refrences childByAutoId] setValue:dictionary withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        
        if (!error) {
            <#statements#>
        }
        
    }];
}
@end
