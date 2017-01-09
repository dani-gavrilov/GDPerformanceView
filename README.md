#GDPerformanceView
Shows FPS, CPU usage, app and iOS versions above the status bar and report FPS and CPU usage via delegate.

![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view.PNG?raw=true "Example PNG")
![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view_2.PNG?raw=true "Example PNG")
![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view_3.PNG?raw=true "Example PNG")
![Alt text](https://github.com/dani-gavrilov/GDPerformanceView/blob/master/performance_view_4.PNG?raw=true "Example PNG")

## Installation
Simply add GDPerformanceMonitoring folder with files to your project, or use CocoaPods.

### Podfile
```ruby
platform :ios, '8.0'
use_frameworks!

target 'project_name' do
	pod 'GDPerformanceView', '~> 1.2.2'
end
```

## Usage

Simply start monitoring. Performance view will be added above the status bar automatically.
Also, you can configure appearance as you like or just hide the monitoring view and use its delegate.

### Start monitoring

Call to start or resume monitoring and show monitoring view.

```objective-c
[[GDPerformanceMonitor sharedInstance] startMonitoring];
```

```objective-c
self.performanceMonitor = [GDPerformanceMonitor alloc] init];
[self.performanceMonitor startMonitoring];
```

### Stop monitoring

Call when you're done with performance monitoring.

```objective-c
[self.performanceMonitor stopMonitoring];
```

Call to hide and pause monitoring.

```objective-c
[self.performanceMonitor pauseMonitoring];
```

### Configuration

Call to change appearance.

```objective-c
[self.performanceMonitor configureWithConfiguration:^(UILabel *textLabel) {
	[textLabel setBackgroundColor:[UIColor blackColor]];
	[textLabel setTextColor:[UIColor whiteColor]];
	[textLabel.layer setBorderColor:[[UIColor blackColor] CGColor]];
}];
```

Call to change output information.

```objective-c
[self.performanceMonitor setAppVersionHidden:YES]
```
```objective-c
[self.performanceMonitor setDeviceVersionHidden:YES];
```

Call to hide monitoring view.

```objective-c
[self.performanceMonitor hideMonitoring];
```

### Start monitoring and configure

```objective-c
[self.performanceMonitor startMonitoringWithConfiguration:^(UILabel *textLabel) {
	[textLabel setBackgroundColor:[UIColor blackColor]];
	[textLabel setTextColor:[UIColor whiteColor]];
	[textLabel.layer setBorderColor:[[UIColor blackColor] CGColor]];
}];
```

### Delegate

Set the delegate and implement its method.

```objective-c
[self.performanceMonitor setDelegate:self];
```

```objective-c
- (void)performanceMonitorDidReportFPS:(float)fpsValue CPU:(float)cpuValue {
    NSLog(@"%f %f", fpsValue, cpuValue);
}
```

## Requirements
- iOS 8.0+

## License
GDPerformanceView is available under the MIT license. See the LICENSE file for more info.
