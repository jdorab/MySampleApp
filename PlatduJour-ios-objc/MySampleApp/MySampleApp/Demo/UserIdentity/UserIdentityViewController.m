//
//  UserIdentityViewController.m
//  MySampleApp
//
//
// Copyright 2015 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-objc v0.4
//
#import "UserIdentityViewController.h"
#import "AWSIdentityManager.h"

@interface UserIdentityViewController ()

@end

@implementation UserIdentityViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    AWSIdentityManager *identityManager = [AWSIdentityManager sharedInstance];

    if (identityManager.userName) {
        self.userName.text = identityManager.userName;
    } else {
        self.userName.text = NSLocalizedString(@"GUEST USER", @"Placeholder text for the guest user.");
    }
    self.userID.text = identityManager.identityId;
    NSURL *imageUrl = identityManager.imageURL;

    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *profileImage = [UIImage imageWithData:imageData];
    if (profileImage) {
        self.userImageView.image = profileImage;
    } else {
        self.userImageView.image = [UIImage imageNamed:@"UserIcon"];
    }
}

@end
