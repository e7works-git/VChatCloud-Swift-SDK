**English** | [Korean](./README.ko.md)

# [VChatCloud](https://vchatcloud.com) Swift SDK

![Languages](https://img.shields.io/badge/language-SWIFT-informational)  
![Platform](https://img.shields.io/badge/platform-iOS-informational)
![Platform](https://img.shields.io/badge/macOS-informational)

## How to use

```swift
import VChatCloudSwiftSDK

var userViewModel = UserViewModel(nickname:"", clientKey:"", grade:"", userInfo: [:])
var chatroomViewModel = ChatroomViewModel(channelKey: "", title: "", persons: 0, like: 0, rtcStat: "", roomType: "", lockType: "", userEmail: "", userMax: 0)

if let roomData = await VChatCloudAPI.getRoomInfo(roomId: channelKey),
   let likeCount = await VChatCloudAPI.getLike(roomId: channelKey) {
    chatroomViewModel.channelKey = channelKey
    chatroomViewModel.title = roomData.title
    chatroomViewModel.rtcStat = roomData.rtcStat
    chatroomViewModel.roomType = roomData.roomType
    chatroomViewModel.lockType = roomData.lockType
    chatroomViewModel.userEmail = roomData.userEmail
    chatroomViewModel.userMax = roomData.userMax
    chatroomViewModel.like = likeCount.like_cnt
}

do {
    let channel = try await VChatCloud.shared.connect(chatroomViewModel: chatroomViewModel, userViewModel: userViewModel)
    // Create your own channel delegate
    channel.delegate = MyChannel.shared
    try await channel.join()
    _ = await channel.getClientList()
} catch {
    if let channelError = error as? ChannelError {
        VChatCloud.shared.disconnect()
        debugPrint("code: \(error.code) description: \(error.description)")
    }
}
```

## Installation

### Swift Package Manager

The Swift Package Manager is integrated into the Swift compiler as a tool to automate the distribution of Swift code.

To add VChatCloudSwiftSDK as a dependency, simply add VChatCloudSwiftSDK to the dependency value in the package list in Package.swift or Xcode.

```swift
dependencies: [
    .package(url: "https://github.com/e7works-git/VChatCloud-Swift-SDK.git", .upToNextMajor(from: "1.0.0"))
]
```

A more detailed usage guide is available on the [VChatCloud Docs](https://vchatcloud.com/doc/ios/).
