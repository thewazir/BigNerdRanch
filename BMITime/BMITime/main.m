//
//  main.m
//  BMITime
//
//  Created by Omer Wazir on 7/27/14.
//  Copyright (c) 2014 Omer Wazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        //Create an array of employees
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        for(int i =0; i < 10; i++){
            BNREmployee *zabaleta = [[BNREmployee alloc] init];
            
            //give the instance interesting values
            [zabaleta setWeightInKilos:(90 + i)];
            [zabaleta setHeightInMeters:((1.9 - i) / 10)];
            [zabaleta setEmployeedID:(1000 + i)];
            
            [employees addObject:zabaleta];
        }
        
        //Create 10 assets
        for (int i = 0; i < 10; i++) {
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            NSString *label = [NSString stringWithFormat:@"Laptop %d",i];
            [asset setLabel:label];
            
            [asset setResaleValue:(350 + i * 17)];
            
            //Get a random number between 0 and 9 inclusive
            NSUInteger randomIndex = random() % [employees count];
            
            //Find that employeed
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            //Assign the asset to the employee
            [randomEmployee addAsset:asset];
        }
        
        NSLog(@"%@",employees);
        
        NSLog(@"Employee 2 is giving up an asset");
        BNREmployee *employee2 =[employees objectAtIndex:2];
        BNRAsset *asset = [[employee2 assets] firstObject];
        [employee2 removeAsset:asset];
        
        
        NSLog(@"Giving up ownsership of one employee.");
        
        [employees removeObjectAtIndex:5];
        
        NSLog(@"Giving up ownership of employees array.");
        
        employees = nil;
        
    }
    sleep(100);
    return 0;
}
