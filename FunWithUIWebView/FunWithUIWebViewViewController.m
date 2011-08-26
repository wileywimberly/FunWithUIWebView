//
//  FunWithUIWebViewViewController.m
//  FunWithUIWebView
//
//  Created by Wiley Wimberly on 8/23/11.
//  Copyright 2011 Warm Fuzzy Apps LLC. All rights reserved.
//

#import "FunWithUIWebViewViewController.h"

@implementation FunWithUIWebViewViewController
@synthesize webView;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];

    [self processLogger];
}


- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = [request URL];
    
    if ([[url scheme] isEqualToString:@"js2objc"]) {
    
        [self helloFromJavaScript:[[url path] substringFromIndex:1]]; // remove leading / from path
        
        return NO; // prevent request
    
    } else {
    
        return YES; // allow request
    }
}


- (void) processLogger {
    
    NSString *msg = nil;
    
    while((msg = [webView stringByEvaluatingJavaScriptFromString:@"logger.dequeue();"]) && msg.length != 0 ) {
        NSLog(@"%@", msg);
    }
    
    [self performSelector:@selector(processLogger) withObject:nil afterDelay:0.1];
}

- (IBAction)helloFromObjectiveC:(id)sender {
    
    
    NSString *js = @"document.getElementById('output').innerHTML = 'hello from Objective-C';";
        
    NSString *res = [webView stringByEvaluatingJavaScriptFromString:js];
    
    NSLog(@"%@", res);

}

- (void)helloFromJavaScript:(NSString*)msg {
    
    NSLog(@"%@",msg);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" 
                                                    message:msg
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
