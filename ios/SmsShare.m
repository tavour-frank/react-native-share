//
//  EmailShare.m
//  RNShare
//
//  Created by Diseño Uno BBCL on 23-07-16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "SmsShare.h"


@implementation SmsShare
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {

    NSLog(@"Try open view");

    if ([options objectForKey:@"message"] && [options objectForKey:@"message"] != [NSNull null]) {
        NSString *text = [RCTConvert NSString:options[@"message"]];

        NSLog(@"Try open view");

        NSString *subject = @"";
        NSString *message = @"";
        if ([options objectForKey:@"subject"] && [options objectForKey:@"subject"] != [NSNull null]) {
            subject = [RCTConvert NSString:options[@"subject"]];
        }

        message = [RCTConvert NSString:options[@"message"]];

        if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null]) {
            NSString *url = [RCTConvert NSString:options[@"url"]];
            message = [message stringByAppendingString: [@" " stringByAppendingString: options[@"url"]] ];
        }

        NSString * urlSms = [NSString stringWithFormat:@"sms:?body=%@", message ];
        NSURL * smsUrl = [NSURL URLWithString:[urlSms stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

        if ([[UIApplication sharedApplication] canOpenURL: smsUrl]) {
            [[UIApplication sharedApplication] openURL: smsUrl];
            successCallback(@[]);
        } else {
            // Cannot open email
            NSLog(@"Cannot open sms");
        }
    }

}

@end
