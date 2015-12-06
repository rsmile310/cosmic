![MaterialKit](http://www.materialkit.io/MK/MaterialKit.png)

# Welcome to MaterialKit

MaterialKit is built as an animation and graphics framework. A major goal in the design of MaterialKit is to allow the creativity of others to easily be expressed. The following README is written to get you started, and is by no means a complete tutorial on all that is possible. Examples may be found in the Examples directory that go beyond the README documentation.

### CocoaPods Support

MaterialKit is on CocoaPods under the name [MK](https://cocoapods.org/?q=MK).

### MaterialLayer

MaterialLayer is a lightweight CAShapeLayer used throughout MaterialKit. It is designed to easily take shape, depth, and animations. Below is an example demonstrating the ease of adding shape and depth to MaterialLayer.

![MaterialKitMaterialLayer](http://www.materialkit.io/MK/MaterialKitMaterialLayer.gif)

```swift
let materialLayer: MaterialLayer = MaterialLayer(frame: CGRectMake(132, 132, 150, 150))
materialLayer.image = UIImage(named: "BluePattern")
materialLayer.shape = .Circle
materialLayer.shadowDepth = .Depth2

// Add layer to UIViewController.
view.layer.addSublayer(materialLayer)
```

### MaterialView

MaterialView is the base UIView class used throughout MaterialKit. Like MaterialLayer, it is designed to easily take shape, depth, and animations. The major difference is that MaterialView has all the added features of the UIView class. Below is an example of setting a MaterialView's cornerRadius, shape, and depth.

![MaterialKitMaterialView](http://www.materialkit.io/MK/MaterialKitMaterialView.gif)

```swift
let materialView: MaterialView = MaterialView(frame: CGRectMake(107, 107, 200, 200))
materialView.image = UIImage(named: "Flower")
materialView.shape = .Square
materialView.shadowDepth = .Depth5
materialView.cornerRadius = .Radius3

// Add view to UIViewController.
view.addSubview(materialView)
```

### MaterialPulseView

MaterialPulseView is

### FlatButton

A FlatButton is the best place to start when introducing MaterialKit buttons. It is simple, clean, and very effective. Below is an example of a FlatButton in action.

![MaterialKitFlatButton](http://www.materialkit.io/MK/MaterialKitFlatButton.gif)

```swift
let button: FlatButton = FlatButton(frame: CGRectMake(107, 107, 200, 65))
button.setTitle("Flat", forState: .Normal)
button.titleLabel!.font = RobotoFont.mediumWithSize(32)

// Add to UIViewController.
view.addSubview(button)
```

### RaisedButton

A RaisedButton is sure to get attention. Take a look at the following animation example.

![MaterialKitRaisedButton](http://www.materialkit.io/MK/MaterialKitRaisedButton.gif)

```swift
let button: RaisedButton = RaisedButton(frame: CGRectMake(107, 207, 200, 65))
button.setTitle("Raised", forState: .Normal)
button.titleLabel!.font = RobotoFont.mediumWithSize(32)

// Add to UIViewController.
view.addSubview(button)
```

### FabButton

A FabButton is essential to Material Design's overall look. Below showcases its beauty.

![MaterialKitFabButton](http://www.materialkit.io/MK/MaterialKitFabButton.gif)

```swift
let img: UIImage? = UIImage(named: "ic_create_white")
let button: FabButton = FabButton(frame: CGRectMake(175, 315, 64, 64))
button.setImage(img, forState: .Normal)
button.setImage(img, forState: .Highlighted)

// Add to UIViewController.
view.addSubview(button)
```

### NavigationBarView

One of Material Design's greatest additions to UI is the NavigationBarView. In the Examples folder, you can checkout some code to get you started with this wonderful component.

![MaterialKitNavigationBarView](http://www.materialkit.io/MK/MaterialKitNavigationBarView.gif)

```swift
let navigationBarView: NavigationBarView = NavigationBarView()

// Stylize.
navigationBarView.backgroundColor = MaterialColor.indigo.darken1

// To lighten the status bar add the "View controller-based status bar appearance = NO"
// to your info.plist file and set the following property.
navigationBarView.statusBarStyle = .LightContent

// Title label.
let titleLabel: UILabel = UILabel()
titleLabel.text = "MaterialKit"
titleLabel.textAlignment = .Left
titleLabel.textColor = MaterialColor.white
titleLabel.font = RobotoFont.regularWithSize(20)
navigationBarView.titleLabel = titleLabel
navigationBarView.titleLabelInsetsRef.left = 64

// Detail label
let detailLabel: UILabel = UILabel()
detailLabel.text = "Build Beautiful Software"
detailLabel.textAlignment = .Left
detailLabel.textColor = MaterialColor.white
detailLabel.font = RobotoFont.regularWithSize(12)
navigationBarView.detailLabel = detailLabel
navigationBarView.detailLabelInsetsRef.left = 64

// Menu button.
let img1: UIImage? = UIImage(named: "ic_menu_white")
let btn1: FlatButton = FlatButton()
btn1.pulseColor = MaterialColor.white
btn1.pulseFill = true
btn1.pulseScale = false
btn1.setImage(img1, forState: .Normal)
btn1.setImage(img1, forState: .Highlighted)

// Star button.
let img2: UIImage? = UIImage(named: "ic_star_white")
let btn2: FlatButton = FlatButton()
btn2.pulseColor = MaterialColor.white
btn2.pulseFill = true
btn2.pulseScale = false
btn2.setImage(img2, forState: .Normal)
btn2.setImage(img2, forState: .Highlighted)

// Search button.
let img3: UIImage? = UIImage(named: "ic_search_white")
let btn3: FlatButton = FlatButton()
btn3.pulseColor = MaterialColor.white
btn3.pulseFill = true
btn3.pulseScale = false
btn3.setImage(img3, forState: .Normal)
btn3.setImage(img3, forState: .Highlighted)

// Add buttons to left side.
navigationBarView.leftButtons = [btn1]

// Add buttons to right side.
navigationBarView.rightButtons = [btn2, btn3]

// To support orientation changes, use MaterialLayout.
view.addSubview(navigationBarView)
navigationBarView.translatesAutoresizingMaskIntoConstraints = false
MaterialLayout.alignFromTop(view, child: navigationBarView)
MaterialLayout.alignToParentHorizontally(view, child: navigationBarView)
MaterialLayout.height(view, child: navigationBarView, height: 70)
```

### CardView

Right out of the box to a fully customized configuration, CardView always stands out. Take a look at a few examples in action and find more in the Examples directory.

![MaterialKitCardView](http://www.materialkit.io/MK/MaterialKitCardView.gif)

```swift
let cardView: CardView = CardView()

// Title label.
let titleLabel: UILabel = UILabel()
titleLabel.text = "Welcome Back!"
titleLabel.textColor = MaterialColor.blue.darken1
titleLabel.font = RobotoFont.mediumWithSize(20)
cardView.titleLabel = titleLabel

// Detail label
let detailLabel: UILabel = UILabel()
detailLabel.text = "It’s been a while, have you read any new books lately?"
detailLabel.numberOfLines = 0
cardView.detailLabel = detailLabel

// Yes button.
let btn1: FlatButton = FlatButton()
btn1.pulseColor = MaterialColor.blue.lighten1
btn1.pulseFill = true
btn1.pulseScale = false
btn1.setTitle("YES", forState: .Normal)
btn1.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)

// No button.
let btn2: FlatButton = FlatButton()
btn2.pulseColor = MaterialColor.blue.lighten1
btn2.pulseFill = true
btn2.pulseScale = false
btn2.setTitle("NO", forState: .Normal)
btn2.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)

// Add buttons to left side.
cardView.leftButtons = [btn1, btn2]

// To support orientation changes, use MaterialLayout.
view.addSubview(cardView)
cardView.translatesAutoresizingMaskIntoConstraints = false
MaterialLayout.alignFromTop(view, child: cardView, top: 100)
MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
```

Easily remove the pulse animation and add a background image for an entirely new feel.

![MaterialKitCardViewFavorite](http://www.materialkit.io/MK/MaterialKitCardViewFavorite.gif)

```swift
let cardView: CardView = CardView()
cardView.divider = false
cardView.backgroundColor = MaterialColor.red.darken1
cardView.pulseScale = false
cardView.pulseColor = nil

// Image.
cardView.image = UIImage(named: "iTunesArtwork")?.resize(toWidth: 400)
cardView.contentsGravity = .BottomRight

// Title label.
let titleLabel: UILabel = UILabel()
titleLabel.text = "MaterialKit"
titleLabel.textColor = MaterialColor.white
titleLabel.font = RobotoFont.mediumWithSize(24)
cardView.titleLabel = titleLabel

// Detail label
let detailLabel: UILabel = UILabel()
detailLabel.text = "Build beautiful software."
detailLabel.textColor = MaterialColor.white
detailLabel.numberOfLines = 0
cardView.detailLabel = detailLabel

// Favorite button.
let img1: UIImage? = UIImage(named: "ic_favorite_white")
let btn1: FlatButton = FlatButton()
btn1.pulseColor = MaterialColor.white
btn1.pulseFill = true
btn1.pulseScale = false
btn1.setImage(img1, forState: .Normal)
btn1.setImage(img1, forState: .Highlighted)

// Add buttons to left side.
cardView.leftButtons = [btn1]

// To support orientation changes, use MaterialLayout.
view.addSubview(cardView)
cardView.translatesAutoresizingMaskIntoConstraints = false
MaterialLayout.alignFromTop(view, child: cardView, top: 100)
MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
```

Adjust the alignment of the UI elements to create different configurations of the CardView.

![MaterialKitCardViewDataDriven](http://www.materialkit.io/MK/MaterialKitCardViewDataDriven.gif)

```swift
let cardView: CardView = CardView()
cardView.dividerInsetsRef.left = 100
cardView.titleLabelInsetsRef.left = 100
cardView.detailLabelInsetsRef.left = 100
cardView.pulseColor = MaterialColor.teal.lighten4

// Image.
cardView.image = UIImage(named: "GraphKit")
cardView.contentsGravity = .TopLeft

// Title label.
let titleLabel: UILabel = UILabel()
titleLabel.text = "GraphKit"
titleLabel.font = RobotoFont.mediumWithSize(24)
cardView.titleLabel = titleLabel

// Detail label
let detailLabel: UILabel = UILabel()
detailLabel.text = "Build scalable data-driven apps."
detailLabel.numberOfLines = 0
cardView.detailLabel = detailLabel

// LEARN MORE button.
let btn1: FlatButton = FlatButton()
btn1.pulseColor = MaterialColor.teal.lighten1
btn1.pulseFill = true
btn1.pulseScale = false
btn1.setTitle("LEARN MORE", forState: .Normal)
btn1.setTitleColor(MaterialColor.teal.darken1, forState: .Normal)

// Add buttons to right side.
cardView.rightButtons = [btn1]

// To support orientation changes, use MaterialLayout.
view.addSubview(cardView)
cardView.translatesAutoresizingMaskIntoConstraints = false
MaterialLayout.alignFromTop(view, child: cardView, top: 100)
MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
```

CardViews are so flexible they create entirely new components by removing all but certain elements. For example, bellow is a button bar by only setting the button values of the CardView.

![MaterialKitCardViewButtonBar](http://www.materialkit.io/MK/MaterialKitCardViewButtonBar.gif)

```swift
let cardView: CardView = CardView()
cardView.divider = false
cardView.pulseColor = nil
cardView.pulseScale = false
cardView.backgroundColor = MaterialColor.blueGrey.darken4

// Favorite button.
let img1: UIImage? = UIImage(named: "ic_search_white")
let btn1: FlatButton = FlatButton()
btn1.pulseColor = MaterialColor.white
btn1.pulseFill = true
btn1.pulseScale = false
btn1.setImage(img1, forState: .Normal)
btn1.setImage(img1, forState: .Highlighted)

// BUTTON 1 button.
let btn2: FlatButton = FlatButton()
btn2.pulseColor = MaterialColor.teal.lighten3
btn2.pulseFill = true
btn2.pulseScale = false
btn2.setTitle("BUTTON 1", forState: .Normal)
btn2.setTitleColor(MaterialColor.teal.lighten3, forState: .Normal)

// BUTTON 2 button.
let btn3: FlatButton = FlatButton()
btn3.pulseColor = MaterialColor.teal.lighten3
btn3.pulseFill = true
btn3.pulseScale = false
btn3.setTitle("BUTTON 2", forState: .Normal)
btn3.setTitleColor(MaterialColor.teal.lighten3, forState: .Normal)

// Add buttons to left side.
cardView.leftButtons = [btn1]

// Add buttons to right side.
cardView.rightButtons = [btn2, btn3]

// To support orientation changes, use MaterialLayout.
view.addSubview(cardView)
cardView.translatesAutoresizingMaskIntoConstraints = false
MaterialLayout.alignFromTop(view, child: cardView, top: 100)
MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
```

### ImageCardView

Bold and attractive, ImageCardView is the next step from a CardView. In the Examples folder you will find examples using the ImageCardView. Below are some animations to give you an idea of the possibilities the ImageCardView has to offer.

![MaterialKitImageCardView](http://www.materialkit.io/MK/MaterialKitImageCardView.gif)

Remove elements, such as the details to create a fresh look for your images.

![MaterialKitImageCardViewBackgroundImage](http://www.materialkit.io/MK/MaterialKitImageCardViewBackgroundImage.gif)

### License

[AGPL-3.0](http://choosealicense.com/licenses/agpl-3.0/)
