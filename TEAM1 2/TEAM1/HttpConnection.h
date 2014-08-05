//
//  HttpConnection.h
//  TEAM1
//
//  Created by Yuan Fusheng on 8/4/14.
//  Copyright (c) 2014 Yuan Fusheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpConnection : NSObject
-(NSString*)getPostDriverURL: (NSDictionary *)dict;
-(NSString*)getAvailableDriverURL:(NSDictionary *)dict;
-(NSString*)getConfirmedPassengersURL:(NSDictionary *)dict;
-(NSString*)confirmTheDriverURL:(NSDictionary *)dict;
-(NSDictionary*) sendHTTPRequest:(NSString*) urlString;
@end
