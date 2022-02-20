# IdramApp v1.0.0
![Platform](https://img.shields.io/badge/platform-iOS-black.svg) ![Badge w/ Version](https://img.shields.io/cocoapods/v/IdramApp.svg)  ![Platform](https://img.shields.io/badge/Swift_Package_Manager-compatible-green.svg) 


**IdramApp** is a very comfortable designed solution for [Idram payment system](https://www.idram.am) integration.

- *Requirements*
- *Installation Guide*
    - *Cocoapods*
    - *Swift Package Manager*
- *Usage*
- *Support*
- *Let us know!*
- *License*

## Requirements

- **iOS 11.0 +**
- **Swift 5.﹡**
- **XCode 10 +**

## Installation

**IdramApp** doesn't contain any external dependencies.

*These are currently the supported installation options:*
  
### [CocoaPods](https://cocoapods.org/)
To integrate **IdramApp** into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
use_frameworks!

target '<Your Target Name>' do
    pod 'IdramApp'
end
```
### [Swift Package Manager](https://swift.org/package-manager/)

The  **Swift Package Manager** is a tool for automating the distribution of Swift code and is integrated into the  `swift`  compiler. It is in early development, but appstore-card-transition does support its use on supported platforms.

Once you have your Swift package set up, adding **IdramApp** as a dependency is as easy as adding it to the  `dependencies`  value of your  `Package.swift`.
```swift
dependencies: [
    .package(url: "https://github.com/yervandsar/IdramApp", from: "1.0.0")
]
```
 Or you can checkout [Adding Package Dependencies to Your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) *by **Apple***

## Usage
1.  After setting up dependencies import app ``` import IdramApp```
2.  In your Info.plist file add following:
    ```xml 
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>idramapp</string>
    </array>
    ```
3.  If you need to open your application you need to set up 'URL Types' in your Info.plist. See [link](http://iosdevelopertips.com/cocoa/launching-your-own-application-via-a-custom-url-scheme.html)
4.  Setup IdramApp in `AppDelegate` and set delegate
    ```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set Account Code
		IdramApp.setAccount("{Account Code}")
        // Set Callback Schem
		IdramApp.setCallbackScheme("{Callback Scheme}")
		// Set Delegate
		IdramListener.setDelegate(self)

        return true
    }
    ```
5. Implement `IdramListenerDelegate` in `AppDelegate` to handle payment response
    ```swift
    extension AppDelegate: IdramListernerDelegate {
	    func didSuccessPayment(_ idramResponse: IdramResponse) {
		    // success handler
	    }
	    func didFailurePayment(_ idramResponse: IdramResponse) {
		    // error handler
	    }
    }
    ```
6. create and run `IdramLink` on pay action
    ```swift
	let link = IdramLink("{Receiver Name}", billNumber: "{EDP_BILL_NO}", amount: {Price}, hasTip: {Bool - false by default})
	link.run()
    ```
## Support

Feel free to [open issuses](https://github.com/yervandsar/IdramApp/issues/new) with any suggestions, bug reports, feature requests, questions.

## Let us know!

We’d be really happy if you sent us links to your projects where you use our component. Just send an email to yervandsar@gmail.com And do let us know if you have any questions or suggestion regarding the animation.


### License

IdramApp is available under the MIT license. See the LICENSE file for more info.
