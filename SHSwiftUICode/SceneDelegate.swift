//
//  SceneDelegate.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/28.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var settings = UserSettings()
    var model = UserModelOne()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
//        let contentView = ContentView()
//        let contentView = BasicText()
//        let contentView = BasicTextField(username: "", nickname: "", password: "")
//        let contentView = BasicButton()
//        let contentView = BasicSpacer()
//        let contentView = BasicDivider()
//        let contentView = BasicImage()
//        let contentView = BasicPicker()
//        let contentView = BasicSlider()
//        let contentView = BasicStepper()
//        let contentView = BasicSegment()
//        let contentView = BasicToggle()
//        let contentView = BasicBottomTab()
//        let contentView = BasicWebView()
//        let contentView = BasicMapView()
//        let contentView = BasicShape()
        
//        let contentView = AnimationScale()
//        let contentView = AnimationOpacityLinear()
//        let contentView = AnimationOffsetEaseOut()
//        let contentView = AnimationRotationEffectSpring()
//        let contentView = AnimationCombinedAnimation()
//        let contentView = AnimationSpeadAndDelay()
//        let contentView = AnimationRepeating()
//        let contentView = AnimationToggleVisibility()
//        let contentView = AnimationAsymmetricTransition()
        
//        let contentView = GestureTap()
//        let contentView = LongPressGestureAndDragGesture()
        
//        let contentView = LayoutBasic()
//        let contentView = LayoutList()
//        let contentView = LayoutScroll()
//        let contentView = LayoutForm()
//        let contentView = LayoutNavigationLink()
//        let contentView = LayoutNavigationLinkM()
        
//        let contentView = PropertyStateDemo()
//        let contentView = PropertyBindingDemo()
//        let contentView = PropertyObservedObjectDemo()
//        let contentView = PropertyEnvironmentObjectDemo().environmentObject(settings)
//        let contentView = PropertyEnvironmentDemo()
        
//        let model1 = InfoModel(description: "A lady with a horse", pictureName: "Picture1")
//        let model2 = InfoModel(description: "An African animal with a very long neck", pictureName: "Picture2")
//        let contentView = LayoutPageNavigation(messages: [model1, model2])
        
//        let contentView = ObjectBinding()
//        let contentView = LayoutShowModal()
//        let contentView = LayoutShowModal()
//        let contentView = LayoutShowAlert()
//        let contentView = LayoutActionSheet()
        
//        let model = UserModelOne()
//        model.nickName = "Super man"
//        let contentView = EnviromentObject().environmentObject(model)
        
        
//        let contentView = ObservedObjectCustomDemo()
        
//        let app = UIApplication.shared
//        let delegate = app.delegate as! AppDelegate
//        let contentView = EnviromentObjectCustomDemo().environmentObject(delegate.eocdData)
        
        
//        let contentView = ExtensionCustomView()
        
//        let contentView = HttpAndJSONDemo()
        let contentView = RecyclerView()
//        let contentView = LoadMoreTest()
//        let contentView = ReloadTest()
//        let contentView = SideMenuDemo()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

