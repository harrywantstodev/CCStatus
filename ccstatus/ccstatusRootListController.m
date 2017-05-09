#include "ccstatusRootListController.h"
#import <Twitter/TWTweetComposeViewController.h>

@implementation ccstatusRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}
- (void)loadView {
	[super loadView];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(tweetSP:)];
	// [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = [UIColor cyanColor];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // self.view.tintColor = [UIColor cyanColor];
    // self.navigationController.navigationBar.tintColor = [UIColor cyanColor];
    // [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = [UIColor cyanColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    self.view.tintColor = nil;
    self.navigationController.navigationBar.tintColor = nil;

}
- (void)tweetSP:(id)sender {
	TWTweetComposeViewController *tweetController = [[TWTweetComposeViewController alloc] init];
    [tweetController setInitialText:@"I'm using #CCStatus by @eta_son set custom control center status messages!"];
  //  [tweetController addImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/Faces.bundle/mockup.png"]];
    [self.navigationController presentViewController:tweetController animated:YES completion:nil];
    [tweetController release];
}
-(void)respring {
	    [self.view endEditing:YES];
         system("killall -9 SpringBoard");
      }
-(void)save
{
    [self.view endEditing:YES];
   	system("killall -9 SpringBoard");
}
@end
