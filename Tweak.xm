%hook SBDashBoardTeachableMomentsContainerViewController //This is the hook class
-(void)_updateText:(id)arg1 { //This is called each time that the text label shows
	UIDevice *device = [UIDevice currentDevice]; // Get current device
	[device setBatteryMonitoringEnabled:YES]; // Set this to true to grab battery percentage
	double percentage = (float)[device batteryLevel] * 100; // Multiply by 100 to get a readable float
	NSString *charging; // Create empty string in memory
	UIDeviceBatteryState deviceBatteryState = [UIDevice currentDevice].batteryState; // Get the current state of the battery
	if (deviceBatteryState == UIDeviceBatteryStateCharging || deviceBatteryState == UIDeviceBatteryStateFull) {
		charging = @"Charging: "; // First part of the charging text
	} else { // If device isn't charging and if the devices battery isn't full
		charging = @"Not charging: "; // First part of the non charging text
	}
	NSString *final = [NSString stringWithFormat:@"%@%.f%%", charging, percentage]; // Final part stes the format for showing charging or not and battery %
	arg1 = [NSString stringWithFormat: @"%@", final]; // Set the text to show 
  %orig;
 }
