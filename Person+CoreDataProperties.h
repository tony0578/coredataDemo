//
//  Person+CoreDataProperties.h
//  coreDataDemo
//
//  Created by 汤维炜 on 16/3/20.
//  Copyright © 2016年 Tommy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *firstname;
@property (nullable, nonatomic, retain) NSString *lastname;
@property (nullable, nonatomic, retain) NSString *decription;

@end

NS_ASSUME_NONNULL_END
