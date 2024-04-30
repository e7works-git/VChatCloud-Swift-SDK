[English](./README.md) | **Korean**

# [VChatCloud](https://vchatcloud.com) Swift SDK

![Languages](https://img.shields.io/badge/language-SWIFT-informational)  
![Platform](https://img.shields.io/badge/platform-iOS-informational)
![Platform](https://img.shields.io/badge/macOS-informational)

## 사용 방법

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

## 설치

### Swift Package Manager

스위프트 패키지 매니저는 스위프트 코드의 배포를 자동화하기 위한 도구로서 스위프트 컴파일러에 통합되어 있습니다.

VChatCloudSwiftSDK를 종속성으로 추가하려면 Package.swift 또는 Xcode의 패키지 목록의 종속성 값에 VChatCloudSwiftSDK를 추가하기만 하면 됩니다.

```swift
dependencies: [
    .package(url: "https://github.com/e7works-git/VChatCloud-Swift-SDK.git", .upToNextMajor(from: "1.0.0"))
]
```

보다 자세한 사용 가이드는 [VChatCloud Docs](https://vchatcloud.com/doc/ios/)에서 확인할 수 있습니다.
