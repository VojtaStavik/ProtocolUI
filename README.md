# ProtocolUI
[![Build Status](https://travis-ci.org/VojtaStavik/ProtocolUI.svg?branch=version_0_1)](https://travis-ci.org/VojtaStavik/ProtocolUI)
#### News:
*(last update: 10th October 2015)*

The project is now in the "proof of concept" state. I'm currently working on the first version for the real world usage.

###### My To-Do list for v1 (release planned for November 2015):

☑ Add support for all IB-friendly UIKit elements

☑ Extend the range of base protocols to support more variables

☑ Use IBDesignable for the live preview in IB

☑ Unit tests coverage

☑ Convert the project to a framework

☑ Carthage and CocoaPods support

☑ Setup continuous integration

☐ Real-world testing (in progress): I use ProtocolUI for 2 apps I'm currently working on at [STRV](http://www.strv.com). 


### Protocol based UIKit customization: ProtocolUI

Let me introduce you **ProtocolUI**. ```ProtocolUI.swift``` is a helper file which contains definitions for a dozen protocols. These protocols reflect the very basic *(so far)* UIKit customizable properties. You can use these protocols as a base for your own protocols. By adding extensions to them, you can modify their values and customize views that conform to the protocols.

#### How to use it:

Add this repository as a git submodule. Link the ```ProtocolUI.swift``` file to your project.


#### Example 1:
I want to set the ```UIView``` background color to green:

- Pick a base protocol which modifies the ```backgroundColor``` property:
     
```swift
protocol BackgroundColor { var pBackgroundColor: UIColor { get } }
```


- Create you own protocol and its extension, which will return the desired value

```swift
protocol GreenBackgroundColor : BackgroundColor  { }

extension GreenBackgroundColor { 
      		
	var pBackgroundColor : UIColor { return UIColor.greenColor() }
} 
```

- Make your custom view to conform to the protocol:

```swift
class MyView : UIView, GreenBackgroundColor { }
```

That’s all. When you now use the ```MyView``` class in a storyboard and run the app, the view will have a green background.

![Example 1](http://vojtastavik.com//images/2015-07-29/protocol-ui-1.png)


You can apply the very same protocol to other UIKit elements, too:

```swift
class MyButton : UIButton, GreenBackgroundColor { }
class MyTextField : UITextField, GreenBackgroundColor { }
```

![Example 2](http://vojtastavik.com//images/2015-07-29/protocol-ui-2.png)


#### Example 2:
All buttons should have a yellow background and Helvetica Neue font, size 17.0. All *“call to action”* buttons will also have a green border with a width of 2px.

We create protocols for the background color and button font first. Then we create a protocol named ```ButtonAppearance```, which inherits from these two protocols and works as a shared appearance protocol for all buttons.
```swift
protocol YellowBackgroundColor : BackgroundColor  { }
extension YellowBackgroundColor { 
	var pBackgroundColor : UIColor { return UIColor.yellowColor() }
}

protocol ButtonFont : Font { }
extension ButtonFont { 
	var pFont : UIFont { return UIFont(name: "Helvetica Neue", size: 17.0)! }
}

protocol ButtonAppearance : YellowBackgroundColor, ButtonFont { }
```

We do the same for the ```CallToActionAppearance``` protocol:

```swift
protocol GreenBorder : BorderColor { }
extension GreenBorder { 
	var pBorderColor : UIColor { return UIColor.greenColor() } 
}

protocol DefaultBorderWidth : BorderWidth { }
extension DefaultBorderWidth { 
	var pBorderWidth : CGFloat { return 2.0 } 
}

protocol CallToActionAppearance : GreenBorder, DefaultBorderWidth { }
```

FInally we make our ```UIButton``` subclasses conform to these protocols:

```swift
class RegularButton : UIButton, ButtonAppearance { }
class CallToActionButton : UIButton, ButtonAppearance, CallToActionAppearance { }
```

Result:
![Example 3](http://vojtastavik.com//images/2015-07-29/protocol-ui-3.png)



And again, you can reuse these protocols for any other ```UIKit``` element:

```swift
class CallToActionTextField : UITextField, CallToActionAppearance { }
```

![Example 4](http://vojtastavik.com//images/2015-07-29/protocol-ui-4.png)



If you’re not happy with the predefined protocols, or you want more sophisticated customization, you can customize elements with a closure:

```swift
protocol SmartButtonApperance : CustomClosure { }
extension SmartButtonApperance { 

	var pCustomClosure : ProtocolUICustomClosure {
    
		return { () -> Void in
        
			if let aSelf = self as? UIButton {
                
				aSelf.setTitleColor(UIColor.blackColor(), forState: .Normal)
				aSelf.setTitleColor(UIColor.redColor(), forState: .Highlighted)
			}
		}
	}
}

class MySmartButton : UIButton, ButtonAppearance, SmartButtonApperance { }
```

![Example 5](http://vojtastavik.com//images/2015-07-29/protocol-ui-custom-closure.gif)

## Installation

Please use CocoaPods for installation of this library. Simply add this line to your ```podfile```

```pod 'Protocol-UI', :git => 'https://github.com/VojtaStavik/ProtocolUI'```
