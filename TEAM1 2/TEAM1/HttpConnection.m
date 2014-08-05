//
//  HttpConnection.m
//  TEAM1
//
//  Created by Yuan Fusheng on 8/4/14.
//  Copyright (c) 2014 Yuan Fusheng. All rights reserved.
//

#import "HttpConnection.h"

@implementation HttpConnection

-(NSString*)getPostDriverURL: (NSDictionary *)dict{
    NSString *basicURL = @"http://ec2-54-186-15-130.us-west-2.compute.amazonaws.com:8080/Restful/mobile/postDriver?";

    NSMutableString *appendURL = [[NSMutableString alloc] init];
    for (NSString *key in dict){
        [appendURL appendString:key];
        [appendURL appendString:@"="];
        [appendURL appendString:[dict objectForKey:key]];
        [appendURL appendString:@"&"];
    }
    return [NSString stringWithFormat:@"%@%@", basicURL,
            [appendURL substringToIndex:[appendURL length]-1]];
}

-(NSString*)getAvailableDriverURL:(NSDictionary *)dict{
    NSString *basicURL = @"http://ec2-54-186-15-130.us-west-2.compute.amazonaws.com:8080/Restful/mobile/getAvailableDriver?";
    
    NSMutableString *appendURL = [[NSMutableString alloc] init];
    for (NSString *key in dict){
        [appendURL appendString:key];
        [appendURL appendString:@"="];
        [appendURL appendString:[dict objectForKey:key]];
        [appendURL appendString:@"&"];
    }
    return [NSString stringWithFormat:@"%@%@", basicURL,
            [appendURL substringToIndex:[appendURL length]-1]];
}

-(NSString*)getConfirmedPassengersURL:(NSDictionary *)dict{
    NSString *basicURL = @"http://ec2-54-186-15-130.us-west-2.compute.amazonaws.com:8080/Restful/mobile/getConfirmedPassengers?";
    
    NSMutableString *appendURL = [[NSMutableString alloc] init];
    for (NSString *key in dict){
        [appendURL appendString:key];
        [appendURL appendString:@"="];
        [appendURL appendString:[dict objectForKey:key]];
        [appendURL appendString:@"&"];
    }
    return [NSString stringWithFormat:@"%@%@", basicURL,
            [appendURL substringToIndex:[appendURL length]-1]];
}

-(NSString*)confirmTheDriverURL:(NSDictionary *)dict{
    NSString *basicURL = @"http://ec2-54-186-15-130.us-west-2.compute.amazonaws.com:8080/Restful/mobile/confirmedPassengers?";
    
    NSMutableString *appendURL = [[NSMutableString alloc] init];
    for (NSString *key in dict){
        [appendURL appendString:key];
        [appendURL appendString:@"="];
        [appendURL appendString:[dict objectForKey:key]];
        [appendURL appendString:@"&"];
    }
    return [NSString stringWithFormat:@"%@%@", basicURL,
            [appendURL substringToIndex:[appendURL length]-1]];
}

-(NSDictionary*) sendHTTPRequest:(NSString*) urlString{
    
    NSURL * url = [[NSURL alloc] initWithString:urlString];
    
    // Prepare the request object
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    
    // Prepare the variables for the JSON response
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    
    // Make synchronous request
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&response
                                                error:&error];
//
//    NSMutableDictionary *allCourses = [NSJSONSerialization
//                                       JSONObjectWithData:urlData
//                                       options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];

    NSDictionary *allCourses = [NSJSONSerialization
                                JSONObjectWithData:urlData
                                options:kNilOptions
                                error:&error];
    
//    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
    return allCourses;
}
@end
