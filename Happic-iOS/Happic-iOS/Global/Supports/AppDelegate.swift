//
//  AppDelegate.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/04.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import FirebaseCore
import Firebase
import FirebaseMessaging
import UserNotifications
import KakaoSDKUser

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    // 화면 세로방향 고정
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
        return false
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KakaoSDK.initSDK(appKey: "87cf2952b41116b741f021967c8add1f")
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        Messaging.messaging().token { token, error in
            if let error = error {
                print("FCM 등록토큰 가져오기 오류: \(error.localizedDescription)")
            } else if let token = token {
                print("FCM 등록토큰 : \(token)")
                PushUserRegisterService.shared.registerUserWithFcmToken(token: token) { response in
                    switch response {
                    case .success(_):
                        print("token 전달 성공")
                    default:
                        print("token 전달 실패")
                        break
                    }
                }
            }
        }
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { _, error in
            if let error = error {
                print("Error 발생: 알림 권한 요청: \(error.localizedDescription)")
            }
        }
        
        application.registerForRemoteNotifications()
        
        let userManager = UserManager.shared
        if userManager.hasJwtToken {
            UserApi.shared.accessTokenInfo { data, error in
                if let error = error {
                    if let sdkError = error as? SdkError,
                       sdkError.isInvalidTokenError() == true {
                        userManager.setLoginStatus(isLoginned: false)
                    }
                } else {
                    // 토큰 유효성이 확인된 경우
                    userManager.setLoginStatus(isLoginned: true)
                }
            } 
        } else {
            //유효한 토큰이 없는 경우
            userManager.setLoginStatus(isLoginned: false)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .badge, .sound, .banner])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        guard let userInfo = response.notification.request.content.userInfo as? [String: Any] else { return }
        print(userInfo)
        if let clickAction = userInfo["click_action"] as? String {
            if clickAction  == "1" {
                let capsuleViewController = HappicCapsuleController()
                UIApplication.shared.windows.first?.rootViewController?.present(capsuleViewController, animated: false, completion: nil)
            }
        }
        
        completionHandler()
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let token = fcmToken else { return }
        print("FCM 등록토큰 갱신: \(token)")
        PushUserRegisterService.shared.registerUserWithFcmToken(token: token) { response in
            switch response {
            case .success(_):
                print("token 전달 성공")
            default:
                print("token 전달 실패")
                break
            }
        }
    }
}
