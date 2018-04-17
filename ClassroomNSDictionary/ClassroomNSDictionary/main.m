//
//  main.m
//  ClassroomNSDictionary
//
//  Created by Dmitriy Tarelkin on 13/4/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        
//1 Create NSDictionary using literal declaration.
        NSDictionary* dictionary = @{
                                     @1 : @"first",
                                     @2 : @"second",
                                     @3 : @"third"
                                     };                     //this dictionary will be autoreleased
        
//2 Make it mutable and add several new entries.
        NSMutableDictionary* mutDict = [dictionary mutableCopy];
        [mutDict setObject:@"fourth_entry" forKey:@4];
        [mutDict setObject:@"fifth_entry" forKey:@5];
        [mutDict setObject:@"zero_entry" forKey:@0];
        
        NSLog(@"%@", [mutDict description]);
        
        
//3 Sort it in an ascending and descending order.
        [mutDict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj1 compare:obj2];
        }];
        NSLog(@"%@", [mutDict description]);
        
        NSArray* keys = [mutDict allKeys];
        
    //in ascending order
        NSArray* sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj1 compare:obj2];
        }];
        
        // Check whether required value is contained in the dictionary.
        NSLog(@"Ascending order: %@",[sortedKeys componentsJoinedByString:@"-"]);
        
    //in descending order
        sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj2 compare:obj1];
        }];

        // Check whether required value is contained in the dictionary.
        NSLog(@"Descenfing order: %@",[sortedKeys componentsJoinedByString:@"-"]);

// Check whether required value is contained in the dictionary.
        NSLog(@"Value for this key is: %@", [dictionary objectForKey:@1]); //first
        
        
        //releasing objects
        [mutDict release];
        [keys release];
        [sortedKeys release];
        
// these objects were deallocated and these calls will crash program
        
        [dictionary objectForKey:@2]; //except this call, because dictionary was made using literal syntax (will be autoreleased)
        //[mutDict objectForKey:@1];
        //[keys objectAtIndex:0];
        //[sortedKeys objectAtIndex:0];
        

        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
