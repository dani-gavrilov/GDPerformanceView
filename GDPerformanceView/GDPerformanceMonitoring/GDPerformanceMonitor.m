//
// Copyright © 2016 Gavrilov Daniil
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "GDPerformanceMonitor.h"

#import "GDPerformanceView.h"

@interface GDPerformanceMonitor ()

@property (nonatomic, strong) GDPerformanceView *perfomanceView;

@end

@implementation GDPerformanceMonitor

#pragma mark -
#pragma mark - Init Methods & Superclass Overriders

+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        instance =  [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self subscribeToNotifications];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark - Notifications & Observers

- (void)applicationDidBecomeActiveNotification:(NSNotification *)notification {
    [self.perfomanceView resumeMonitoring];
}

- (void)applicationWillResignActiveNotification:(NSNotification *)notification {
    [self.perfomanceView pauseMonitoring];
}

#pragma mark - 
#pragma mark - Public Methods

- (void)startMonitoringWithConfiguration:(void (^)(UILabel *))configuration {
    if (!self.perfomanceView) {
       [self setupPerfomanceView];
    } else {
        [self.perfomanceView resumeMonitoring];
    }
    
    if (configuration) {
        UILabel *textLabel = [self.perfomanceView textLabel];
        configuration(textLabel);
    }
}

- (void)startMonitoring {
    if (!self.perfomanceView) {
        [self setupPerfomanceView];
    } else {
        [self.perfomanceView resumeMonitoring];
    }
}

- (void)pauseMonitoring {
    [self.perfomanceView pauseMonitoring];
}

- (void)stopMonitoring {
    [self.perfomanceView stopMonitoring];
    self.perfomanceView = nil;
}

- (void)configureWithConfiguration:(void (^)(UILabel *))configuration {
    if (!self.perfomanceView) {
        return;
    }
    
    if (configuration) {
        UILabel *textLabel = [self.perfomanceView textLabel];
        configuration(textLabel);
    }
}

#pragma mark -
#pragma mark - Private Methods

#pragma mark - Default Setups

- (void)subscribeToNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
}

#pragma mark - Monitoring 

- (void)setupPerfomanceView {
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    self.perfomanceView = [[GDPerformanceView alloc] initWithFrame:statusBarFrame];
}

#pragma mark -
#pragma mark - Setters & Getters

- (void)setAppVersionHidden:(BOOL)appVersionHidden {
    _appVersionHidden = appVersionHidden;
    
    if (self.perfomanceView) {
        [self.perfomanceView setAppVersionHidden:appVersionHidden];
    }
}

@end
