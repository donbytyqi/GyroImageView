# GyroImageView
Utilize your devices gyroscope to scroll through an image.

![](https://i.imgur.com/2gQQvfx.gif)

## Installation
Currently, the only way to install it is manually. Simply download GyroImageView.swift file and drag and drop it to your project folder.

## Usage
GyroImageView is fairly easy to implement, simply initiliaze it with a frame and set it's image. That's it.

```swift
let gyroImageView = GyroImageView(frame: UIScreen.main.bounds)
gyroImageView.image = UIImage(named: "test")
// set scrolling speed
gyroImageView.speed = 150.0
view.addSubview(gyroImageView)
