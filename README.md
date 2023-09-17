# flutter_rdkafka_lib

A flutter_rdkafka_lib plugin project.

## 프로젝트 소개
* flutter 앱에서 FCM/APNS 를 경유하지 않고 미들웨어를 통해 통신하는 부분을 검토하다가 시작된 프로젝트


* 이전부터 관심을 갖고 있었고 사용했었던 Kakfa를 대상으로 함. (현업에서 이용하려고 Confluent 한국지사에도 연락했었는데...)


* pub.dev에 있는 headone님의 플러그인 프로젝트(https://github.com/headone/fkafka)를 보고 동기부여를 받아서 참고 


* rdkafka를 이용하여 미구현된 producer/consumer client api를 작성, 내가 더 필요로 하는 부분에 구현 


* 오픈소스 프로젝트로 게시하여 시작하고 완성된 후에 pub.dev에 게시 예정


* 참고한 원 저자의 플러그인 오픈소스 프로젝트는 명시 및 라이선스 준용

## 작업일지(진행중)

### 2023.09.17
* rdkafka를 flutter에서 사용할 수 있도록 5번째 플러그인 프로젝트 시작 및 깃허브 게시


* 작업내용 정리 및 이전 작업 소스파일 적용


* 이전 작업 내용에서 발생한 ios에서 안되던 문제에 대해서 검토해야 함.


* rdkafka api: https://docs.confluent.io/platform/current/clients/librdkafka/html/rdkafka_8h.html#a3d949238471993b18537855aad28fa23 


## 이전 작업일지

### 2023.07.10
  kafka와 flutter 앱 연동 작업 테스트
  => https://github.com/headone/fkafka/tree/master/lib/src/rdkafka

* API
  https://docs.confluent.io/platform/current/clients/librdkafka/html/rdkafka_8h.html#a3d949238471993b18537855aad28fa23

size_t 는 Int32
ssize_t 는 Int64

const 타입은 그대로 타입으로만 바인딩

xcode 에서 라이브러리 인식가능하게 넣어줘야 함. => ios 빌드 오류

* kafka rest proxy -> 안되면 이걸로 방향을 틀자

* https://pub.dev/packages/kafkabr/install    -> 연결 접속은 확인함.

### 2023.07.12
- ffi로 c api 작성후 빌드하여 테스트 하였으나 ios 라이브러리 지원 불가 -> 향후에 사용하게 될지도 몰라서 백업해놓음.
- kafkabr 테스트하였으나 자유도 낮고 오류 발생

### 2023.07.13
- kafka rest proxy로 결정하고 나서 docker로 빌드하여 구성완료
- 프로젝트 라이브러리 정리
- flutter pub add background_fetch

### 2023.07.14
 ```
//flutter backgroud fetch 디버깅
2023-07-14 19:56:07.539740+0900 Runner[2467:1197046] [TSBackgroundFetch load]: (
"<TSBGTask identifier=com.transistorsoft.customtask, delay=0, periodic=0 requiresNetworkConnectivity=0 requiresExternalPower=0, enabled=1>"
)
2023-07-14 19:56:07.541980+0900 Runner[2467:1197046] [TSBGAppRefreshSubscriber load]: {
"flutter_background_fetch" = "<TSBGAppRefreshSubscriber identifier=flutter_background_fetch, executed=0, enabled=1>";
}
2023-07-14 19:56:07.634816+0900 Runner[2467:1197046] Metal API Validation Enabled
2023-07-14 19:56:08.068664+0900 Runner[2467:1197046] [VERBOSE-2:FlutterDarwinContextMetalImpeller.mm(39)] Using the Impeller rendering backend.
2023-07-14 19:56:08.087782+0900 Runner[2467:1197046] [TSBackgroundFetch registerForTaskWithIdentifier: com.transistorsoft.customtask
2023-07-14 19:56:08.258177+0900 Runner[2467:1197046] [TSBackgroundFetch scheduleBGAppRefresh] com.transistorsoft.fetch
2023-07-14 19:56:08.258468+0900 Runner[2467:1197420] flutter: [BackgroundFetch] configure success: 2
2023-07-14 19:56:08.259520+0900 Runner[2467:1197046] [TSBackgroundFetch scheduleProcessingTask] <TSBGTask identifier=com.transistorsoft.customtask, delay=10, periodic=1 requiresNetworkConnectivity=0 requiresExternalPower=0, enabled=1>
2023-07-14 19:56:20.259985+0900 Runner[2467:1197046] BackgroundFetch AppDelegate received fetch event
2023-07-14 19:56:20.260116+0900 Runner[2467:1197046] [TSBackgroundFetch performFetchWithCompletionHandler]
2023-07-14 19:56:20.260189+0900 Runner[2467:1197046] [TSBackgroundFetch scheduleBGAppRefresh] com.transistorsoft.fetch
2023-07-14 19:56:20.262864+0900 Runner[2467:1197420] flutter: [BackgroundFetch] Event received: flutter_background_fetch
2023-07-14 19:56:21.488010+0900 Runner[2467:1197420] flutter: Number of books about http: 1197.
2023-07-14 19:56:46.240936+0900 Runner[2467:1197420] flutter: [BackgroundFetch] TIMEOUT: flutter_background_fetch
2023-07-14 20:03:38.676990+0900 Runner[2467:1200134] [TSBackgroundFetch scheduleProcessingTask] <TSBGTask identifier=com.transistorsoft.customtask, delay=10, periodic=1 requiresNetworkConnectivity=0 requiresExternalPower=0, enabled=1>
2023-07-14 20:03:38.678766+0900 Runner[2467:1197420] flutter: [BackgroundFetch] Event received: com.transistorsoft.customtask
2023-07-14 20:04:46.187976+0900 Runner[2467:1197416] [TSBackgroundFetch expirationHandler] WARNING: BGProcessingTask 'com.transistorsoft.customtask' expired before #finish was executed.
2023-07-14 20:04:46.188878+0900 Runner[2467:1197420] flutter: [BackgroundFetch] TIMEOUT: com.transistorsoft.customtask
2023-07-14 20:05:02.070415+0900 Runner[2467:1197046] [SystemGestureGate] <0x15f02e8d0> Gesture: System gesture gate timed out.
2023-07-14 20:05:02.071559+0900 Runner[2467:1197046] [SystemGestureGate] <0x15f00b0c0> Touch: System gesture gate timed out.
2023-07-14 20:14:25.799191+0900 Runner[2467:1197046] BackgroundFetch AppDelegate received fetch event
2023-07-14 20:14:25.799324+0900 Runner[2467:1197046] [TSBackgroundFetch performFetchWithCompletionHandler]
2023-07-14 20:14:25.799402+0900 Runner[2467:1197046] [TSBackgroundFetch scheduleBGAppRefresh] com.transistorsoft.fetch
2023-07-14 20:14:25.799667+0900 Runner[2467:1197046] Warning: Application delegate received call to -application:performFetchWithCompletionHandler: but the completion handler was never called.
2023-07-14 20:14:51.793200+0900 Runner[2467:1197420] flutter: [BackgroundFetch] TIMEOUT: flutter_background_fetch
 ```

### 2023.07.16
rabbitmq로 테스트 중. 7년전에 비해서 많이 안정화 됨

https://dev-yakuza.posstree.com/ko/flutter/flutter_local_notifications/

* 오픈커뮤니티 질문/답변
 ```
서버에서 푸시를 보내면 그에 대한 알람을 화면에 표시할 뿐이고,
앱이 새로(또는 다시) 포그라운드에 올라올 때..
앱마다 자신에 맞는 작업을 수행한다고 생각하시면 거의 맞을 거에요
-> 그럼 지금 모바일 설정부분을 보니까 알림 권한을 획득한 앱은 또다른 방식으로 푸쉬알림을 받고
백그라운드 실행과는 관련없는거네요.
백그라운드 실행은 그냥 앱이 살아있는 동안에 포그라운 실행중에 지연시간이 많이 걸리는 거를
백그라운드로 비동기 처리하는 방식의 권한이라고 생각하면 되는거죠.. 감사합니다. 
 ```

 ```
//디버깅 1번째
[VERBOSE-2:dart_vm_initializer.cc(41)] Unhandled Exception: ChannelException(PRECONDITION_FAILED):
PRECONDITION_FAILED - inequivalent arg 'durable' for exchange 'test.exchanges_fanout' in vhost '/':
received 'false' but current is 'true'

//디버깅 2번째
https://ksrapp.tistory.com/29
ios -> Runner -> AppDelegate.swift에 아래 코드 추가
if #available(iOS 10.0, *) {
UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
}
 ```

(참고) https://velog.io/@ezidayzi/iOS-Push-Notification-처리하기

푸시알림을 핸들링하기 위해 고려해야 할 상황은 4가지
1) 앱이 종료되어 있는 경우
2) 앱이 실행 중인 경우
3) 앱이 백그라운드인 경우
4) 사용자가 푸시 알림을 클릭한 경우
 ```
//https://learnflutter.co/flutter-push-notification-ios-appdelegate-swift/

import UIKit
import Flutter
import RMQClient

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
override func application(
_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {

        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }

//        let delegate = RMQConnectionDelegateLogger() // implement RMQConnectionDelegate yourself to react to errors
//        let conn = RMQConnection(uri: "amqp://", delegate: delegate)
//        conn.start()
//        let ch = conn.createChannel()
//        let q = ch.queue("topic1", options: [.durable])
//        q.subscribe({ m in
//            UNUserNotificationCenter.current()
//                // 2 -알림을 표시하기 위한 승인을 요청합니다. 전달된 옵션은 앱에서 사용하려는 알림 유형을 나타냅니다. 여기에서 알림(alert), 소리(sound) 및 배지(badge)를 요청합니다.
//                    .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
//                        // 3 - 완료 핸들러는 인증이 성공했는지 여부를 나타내는 Bool을 수신합니다. 인증 결과를 표시합니다.
//                        print("Permission granted: \(granted)")
//            }
//           print("Received: \(String(data: m.body, encoding: String.Encoding.utf8))")
//        })
//
if (launchOptions?[.remoteNotification]) != nil {
let delegate = RMQConnectionDelegateLogger() // implement RMQConnectionDelegate yourself to react to errors
let conn = RMQConnection(uri: "amqp://", delegate: delegate)
conn.start()
let ch = conn.createChannel()
let q = ch.queue("myqueue")
q.subscribe({ m in
UNUserNotificationCenter.current()
// 2 -알림을 표시하기 위한 승인을 요청합니다. 전달된 옵션은 앱에서 사용하려는 알림 유형을 나타냅니다. 여기에서 알림(alert), 소리(sound) 및 배지(badge)를 요청합니다.
.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
// 3 - 완료 핸들러는 인증이 성공했는지 여부를 나타내는 Bool을 수신합니다. 인증 결과를 표시합니다.
print("Permission granted: \(granted)")
}
print("Received: \(String(data: m.body, encoding: String.Encoding.utf8))")
})
//            q.publish("foo".data(using: String.Encoding.utf8))
}

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationDidEnterBackground(_ application: UIApplication){
        application.applicationIconBadgeNumber = 0
    }

    override func applicationDidFinishLaunching(_ application: UIApplication) {

    }
}
 ```

##Podfile backup
 ```
# Uncomment this line to define a global platform for your project
platform :ios, '13.0'

# CocoaPods analytics sends network stats synchronously affecting flutter build latency.
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

project 'Runner', {
'Debug' => :debug,
'Profile' => :release,
'Release' => :release,
}

def flutter_root
generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
unless File.exist?(generated_xcode_build_settings_path)
raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter pub get is executed first"
end

File.foreach(generated_xcode_build_settings_path) do |line|
matches = line.match(/FLUTTER_ROOT\=(.*)/)
return matches[1].strip if matches
end
raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try deleting Generated.xcconfig, then run flutter pub get"
end

require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper'), flutter_root)

flutter_ios_podfile_setup

target 'Runner' do
use_frameworks!
use_modular_headers!

flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
target 'RunnerTests' do
inherit! :search_paths
end

pod 'RMQClient', '~> 0.12.0'
end

post_install do |installer|
# Set Bundle Identifier for RMQClient
    xcconfig_path = "Pods/Target Support Files/Pods-Runner/Pods-Runner.release.xcconfig"
    bundle_identifier = "io.pivotal.RMQClient"

    File.open(xcconfig_path, "a") do |file|
      file.puts "\nPRODUCT_BUNDLE_IDENTIFIER = #{bundle_identifier}"
    end
installer.pods_project.targets.each do |target|
flutter_additional_ios_build_settings(target)
end
end
 ```

### 2023.07.17

* ios swift push 알림 : https://kakao-tam.tistory.com/135
 

* push notification 권한 관련 => https://ts2ree.tistory.com/283


* https://sweetdev.tistory.com/803 <= ios 13이상부터 remote push 방법 변경


### 2023.07.18

* 앱에서 push message를 받으려면 구글의 FCM 애플의 APNS를 경유해야 한다. 이 사실을 알고 지금 진행중인 프로젝트는 중단.

