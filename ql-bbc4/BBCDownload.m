#import <Foundation/Foundation.h>
#import <Foundation/NSJSONSerialization.h>

NSData* renderBBC4(NSURL* url)
{
    @autoreleasepool {
        NSString *styles = [[NSString alloc] initWithContentsOfFile:[[NSBundle bundleWithIdentifier: @"bbc.co.uk.ql-bbc4"]
                                                                      pathForResource:@"styles" ofType:@"css"]
                                                                      encoding:NSUTF8StringEncoding
                                                                      error:nil];
        
        //Using a FileWrapper is likely to be 'the way' to do this..
        //NSFileWrapper *packageWrapper = [NSFileWrapper url];
        //NSString *json = packageWrapper[read]
        
        //Using this fails as NSURL doesn't treat url as a directory
        //NSURL *packageURL = [NSURL URLWithString:@"programme.json" relativeToURL:url];
        
        NSString *filePath = [[url absoluteString] stringByAppendingPathComponent:@"programme.json"];

        
        NSURL *packageURL = [NSURL URLWithString:filePath];
//        NSStringEncoding usedEncoding = 0;
//        NSError *e = nil;
        
//        NSString *source = [[NSString alloc] initWithContentsOfURL:packageURL usedEncoding:&usedEncoding error:&e];
//        
//        if (usedEncoding == 0) {
//            NSLog(@"Wasn't able to determine encoding for file “%@” “%@”",
//                  [packageURL path], [url path]);
//        }
        
        
        NSData *data = [NSData dataWithContentsOfURL:packageURL];
        NSError *err;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];

        //char *output = [source UTF8String];
        NSString *html = [NSString stringWithFormat:@"<!DOCTYPE html>\n"
                          "<html>\n"
                          "<head>\n"
                          "<meta charset=\"utf-8\">\n"
                          "<style>\n%@</style>\n"
                          "<base href=\"%@\"/>\n"
                          "</head>\n"
                          "<body>\n"
                          "<h1>%@</h1>"
                          "<h2>%@</h2>"
                          "</body>\n"
                          "</html>",
                          styles, url, dict[@"title"], dict[@"subtitle"]];
        
        //free(output);
        return [html dataUsingEncoding:NSUTF8StringEncoding];
    }
}
