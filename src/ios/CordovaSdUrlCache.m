//
//  CordovaSdUrlCache.m
//  cordova-sd-url-cache
//
//  Created by David Azevedo  on 02/08/2016.
//
//

#import "CordovaSdUrlCache.h"
#import "SDURLCache.h"

@implementation CordovaSdUrlCache

- (void)pluginInitialize
{

    id sdUrlCacheMemoryCapacityString = [self.commandDelegate.settings objectForKey: [@"sdUrlCacheMemoryCapacity" lowercaseString]];
    int sdUrlCacheMemoryCapacity = sdUrlCacheMemoryCapacityString == nil ? 4 : [sdUrlCacheMemoryCapacityString intValue];

    id sdUrlCacheDiskCapacityString = [self.commandDelegate.settings objectForKey: [@"sdUrlCacheDiskCapacity" lowercaseString]];
    int sdUrlCacheDiskCapacity = sdUrlCacheDiskCapacityString == nil ? 32 : [sdUrlCacheDiskCapacityString intValue];

    SDURLCache *urlCache = [[SDURLCache alloc] initWithMemoryCapacity:sdUrlCacheMemoryCapacity*1024*1024
                                                         diskCapacity:sdUrlCacheDiskCapacity*1024*1024
                                                             diskPath:[SDURLCache defaultCachePath]];
    [NSURLCache setSharedURLCache:urlCache];
    [urlCache release];  
}

- (CordovaSdUrlCache*)initWithWebView:(UIWebView*)theWebView
{
    return self;
}

@end