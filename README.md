# News
News is an iOS app that allows users to view headline or search for news articles from the [News API](https://newsapi.org).


## Table of Contents

- [Description](#description)
- [Requirements](#Requirements)
- [Demo](#demo)
- [Installation](#installation)
- [Testing](#testing)
- [Dependencies](#dependencies)
- [Contact](#contact)

## Description

Some of the main features include:

- User can view and scroll through a list of headline news articles
- User can tap a cell to view the news article using WebKit
- User can search for news results, and scroll through a list of results

## Requirements

- iOS 16.0 or later
- iPhone 8, iPhone SE (2nd Generation), or newer

## Demo
### Current Progress Walkthrough
<img src="https://user-images.githubusercontent.com/74223402/219205178-80a4c1f3-35af-4a18-a6ce-1b392f2b49c0.gif" width=250><br>

## Installation

To install and set up the app on your own device, follow these steps:

### Prerequisites
- Xcode 11 or later
- CocoaPods (installation instructions can be found at https://cocoapods.org/)

### Cloning the repository

To clone the repository, open a terminal and enter the following command:
```
git clone https://github.com/kabirdhillon7/News
```

### Installing dependencies

To install the dependencies for the app, navigate to the directory where you cloned the repository and run the following command:
```
pod install
```
This will install all of the dependencies specified in the `Podfile`.

Open the `News.xcworkspace` file in Xcode. Make sure that the `News` scheme is selected, and then click the "Run" button to build and run the app.

### Configuration

Before you can use the app, you will need to set up your API keys. To do this, follow these steps:

1. Go to https://newsapi.org and sign up for an API key.
2. In Xcode, open the `APICaller.swift` file and replace `key` with the API key you received.

## Testing

## Dependencies

This app uses the following dependencies:

- [Alamofire](https://github.com/Alamofire/Alamofire) (MIT License)
- [Alamofire Image](https://github.com/Alamofire/AlamofireImage) (MIT License)
- [Combine](https://developer.apple.com/documentation/combine)
- [WebKit](https://developer.apple.com/documentation/webkit)

## Contact

If you have any questions or feedback, you can reach me through the following channels:

- GitHub: [@kabirdhillon7](https://github.com/kabirdhillon7)
- LinkedIn: [Kabir Dhillon](https://www.linkedin.com/in/kabirdhillon/)
