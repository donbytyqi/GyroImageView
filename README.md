# GyroImageView
Utilize your devices gyroscope to scroll through an image.

<img width="221" height="478" class="spinner" alt="" src="example_images/example.gif" />

## Installation
Currently, the only way to install it is manually. Simply download GyroImageView.swift file and drag and drop it to your project folder.

## Usage
GyroImageView is fairly easy to implement, simply initiliaze it with a frame and set it's image. That's it.

```swift
let gyroImageView = GyroImageView(frame: UIScreen.main.bounds)

// locally set an image
gyroImageView.image = UIImage(named: "test")

// download an image from a url
gyroImageView.imageUrl = ""

// set scrolling speed
gyroImageView.speed = 150.0

// left, middle or right
gyroImageView.startPoint = .middle

// allow scrolling in both X and Y axis
gyroImageView.fullScroll = true

view.addSubview(gyroImageView)
