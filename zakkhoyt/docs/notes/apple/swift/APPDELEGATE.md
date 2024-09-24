# AppDelegate & Friends

Keywords: @UIApplicationDelegateAdaptor, @NSApplicationDelegateAdaptor, UIApplicationDelegate, NSApplicationDelegate, AppDelegate, SceneDelegate

```swift
//
//  MPEngineDevAppApp.swift
//  MPEngineDevApp
//
//  Created by Zakk Hoyt on 12/2/23.
//

import SwiftUI

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif


@main
struct MyApp: App {
#if os(iOS)
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
#elseif os(macOS)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
#endif
    
    init() {
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


#if os(iOS)
class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        logger.debug("\(#function) called")
        // Override point for customization after application launch.
        //        if let window = UIApplication.shared.windows.first {
        //            self.window = window
        //        }
        return true
    }
    
    /// Configures our `SceneDelegate` if we have one
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        logger.debug("\(#function) called")
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    // MARK: - Implements UIWindowSceneDelegate
    
    var window: UIWindow?
    
    // Called when the coordinate space, interface orientation, or trait collection of a UIWindowScene changes
    // Always called when a UIWindowScene moves between screens
    func windowScene(
        _ windowScene: UIWindowScene,
        didUpdate previousCoordinateSpace: UICoordinateSpace,
        interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation,
        traitCollection previousTraitCollection: UITraitCollection
    ) {
        logger.debug("\(#function) called")
    }
    
    /// Called when the user activates your application by selecting a shortcut on the home screen,
    /// and the window scene is already connected.
    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        logger.debug("\(#function) called")
        completionHandler(true)
    }
    
    //    /// - Warning: Non-sendable type 'UIApplicationShortcutItem' in parameter of the protocol requirement satisfied by main actor-isolated instance method 'windowScene(_:performActionFor:)' cannot cross actor boundary
    //    @MainActor func windowScene(
    //        _ windowScene: UIWindowScene,
    //        performActionFor shortcutItem: UIApplicationShortcutItem
    //    ) async -> Bool {
    //        logger.debug("\(#function) called")
    //        return true
    //    }
    
    //    /// Called after the user indicates they want to accept a CloudKit sharing invitation in your application
    //    /// and the window scene is already connected.
    //    /// You should use the CKShareMetadata object's shareURL and containerIdentifier to schedule a CKAcceptSharesOperation, then start using
    //    /// the resulting CKShare and its associated record(s), which will appear in the CKContainer's shared database in a zone matching that of the record's owner.
    //    func windowScene(
    //        _ windowScene: UIWindowScene,
    //        userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShareMetadata
    //    ) {
    //        logger.debug("\(#function) called")
    //    }
    
    // MARK: - Implements UISceneDelegate
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        logger.debug("\(#function) called")
        
        // Use this method toly configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //        guard let windowScene = (scene as? UIWindowScene) else { return }
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        //        let window = UIWindow(windowScene: windowScene)
        //        let rootViewController = MainNavigationController()
        //        window.rootViewController = rootViewController
        //        sceneDelegate?.window = window
        //        window.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(
        _ scene: UIScene
    ) {
        logger.debug("\(#function) called")
    }
    
    func sceneDidBecomeActive(
        _ scene: UIScene
    ) {
        logger.debug("\(#function) called")
    }
    
    func sceneWillResignActive(
        _ scene: UIScene
    ) {
        logger.debug("\(#function) called")
    }
    
    func sceneWillEnterForeground(
        _ scene: UIScene
    ) {
        logger.debug("\(#function) called")
    }
    
    func sceneDidEnterBackground(
        _ scene: UIScene
    ) {
        logger.debug("\(#function) called")
    }
    
    func scene(
        _ scene: UIScene,
        openURLContexts URLContexts: Set<UIOpenURLContext>
    ) {
        logger.debug("\(#function) called")
    }
    
    /// This is the NSUserActivity that will be used to restore state when the Scene reconnects.
    /// It can be the same activity used for handoff or spotlight, or it can be a separate activity
    /// with a different activity type and/or userInfo.
    /// After this method is called, and before the activity is actually saved in the restoration file,
    /// if the returned NSUserActivity has a delegate (NSUserActivityDelegate), the method
    /// userActivityWillSave is called on the delegate. Additionally, if any UIResponders
    /// have the activity set as their userActivity property, the UIResponder updateUserActivityState
    /// method is called to update the activity. This is done synchronously and ensures the activity
    /// has all info filled in before it is saved.
    func stateRestorationActivity(
        for scene: UIScene
    ) -> NSUserActivity? {
        logger.debug("\(#function) called")
        return nil
    }
    
    /// This will be called after scene connection, but before activation, and will provide the
    /// activity that was last supplied to the stateRestorationActivityForScene callback, or
    /// set on the UISceneSession.stateRestorationActivity property.
    /// Note that, if it's required earlier, this activity is also already available in the
    /// UISceneSession.stateRestorationActivity at scene connection time.
    func scene(
        _ scene: UIScene,
        restoreInteractionStateWith stateRestorationActivity: NSUserActivity
    ) {
        logger.debug("\(#function) called")
    }
    
    func scene(
        _ scene: UIScene,
        willContinueUserActivityWithType userActivityType: String
    ) {
        logger.debug("\(#function) called")
    }
    
    func scene(
        _ scene: UIScene,
        continue userActivity: NSUserActivity
    ) {
        logger.debug("\(#function) called")
    }
    
    func scene(
        _ scene: UIScene,
        didFailToContinueUserActivityWithType userActivityType: String,
        error: Error
    ) {
        logger.debug("\(#function) called")
    }
    
    func scene(
        _ scene: UIScene,
        didUpdate userActivity: NSUserActivity
    ) {
        logger.debug("\(#function) called")
    }
}
#elseif os(macOS)

final class AppDelegate: NSObject, NSApplicationDelegate {
    private(set) var window: NSWindow?
    

    //
    @MainActor
    func applicationDidFinishLaunching(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
        
        if let window = NSApplication.shared.windows.first {
            //            window.titleVisibility = .hidden
            //            window.titlebarAppearsTransparent = true
            //            window.isOpaque = false
            //            window.backgroundColor = NSColor.clear
            
//            window.collectionBehavior = .fullScreenPrimary
            window.floatOnTop(enable: true)
            self.window = window
            logger.debug("NSApplication.shared.isFullKeyboardAccessEnabled: \(NSApplication.shared.isFullKeyboardAccessEnabled)")
        }
    }
    
    @MainActor
    func applicationWillHide(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }

    @MainActor
    func applicationDidHide(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }

    @MainActor
    func applicationWillUnhide(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }

    @MainActor
    func applicationDidUnhide(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    @MainActor
    func applicationWillBecomeActive(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    @MainActor
    func applicationDidBecomeActive(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    @MainActor
    func applicationWillResignActive(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    @MainActor
    func applicationDidResignActive(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    @MainActor
    func applicationWillUpdate(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    @MainActor
    func applicationDidUpdate(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    @MainActor
    func applicationWillTerminate(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }

    @MainActor
    func applicationDidChangeScreenParameters(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }

    @MainActor
    func applicationDidChangeOcclusionState(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }

    @MainActor
    func applicationProtectedDataWillBecomeUnavailable(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }

    @MainActor
    func applicationProtectedDataDidBecomeAvailable(
        _ notification: Notification
    ) {
        logger.debug("\(self.traceMessage(function: #function, notification: notification))")
    }
    
    //
    //    /**
    //     Allowable return values are:
    //     @c NSTerminateNow - it is ok to proceed with termination
    //     @c NSTerminateCancel - the application should not be terminated
    //     @c NSTerminateLater - it may be ok to proceed with termination later.  The application must call `-replyToApplicationShouldTerminate:` with @c YES or @c NO once the answer is known
    //     @note This return value is for delegates who need to provide document modal alerts (sheets) in order to decide whether to quit.
    //     */
    //    @MainActor func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply
    //
    //    /**
    //     This will be called for any URLs your application is asked to open. This includes URL types (CFBundleURLTypes) defined in your Info.plist, and Document types (@c CFBundleDocumentTypes) that have no associated @c NSDocument class. Document URLs that have an associated @c NSDocument class will be opened through @c NSDocumentController. If this is implemented, `-application:openFiles:` and `-application:openFile:` will not be called.
    //     */
    //    @MainActor func application(_ application: NSApplication, open urls: [URL])
    //
    //    @MainActor func application(_ sender: NSApplication, openFile filename: String) -> Bool
    //
    //    @MainActor func application(_ sender: NSApplication, openFiles filenames: [String])
    //
    //    @MainActor func application(_ sender: NSApplication, openTempFile filename: String) -> Bool
    //
    //    @MainActor func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool
    //
    //    @MainActor func applicationOpenUntitledFile(_ sender: NSApplication) -> Bool
    //
    //    @MainActor func application(_ sender: Any, openFileWithoutUI filename: String) -> Bool
    //
    //    @MainActor func application(_ sender: NSApplication, printFile filename: String) -> Bool
    //
    //    @MainActor func application(_ application: NSApplication, printFiles fileNames: [String], withSettings printSettings: [NSPrintInfo.AttributeKey : Any], showPrintPanels: Bool) -> NSApplication.PrintReply
    //
    //    @MainActor func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool
    //
    //    @MainActor func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool
    //
    //    @MainActor func applicationDockMenu(_ sender: NSApplication) -> NSMenu?
    //
    //    @MainActor func application(_ application: NSApplication, willPresentError error: Error) -> Error
    //
    //    @MainActor func application(_ application: NSApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    //
    //    @MainActor func application(_ application: NSApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
    //
    //    @MainActor func application(_ application: NSApplication, didReceiveRemoteNotification userInfo: [String : Any])
    //
    //    /**
    //     Method to opt-in to secure restorable state.
    //
    //     When this returns @c YES:
    //     * NSCoders that are passed into the various @c NSWindowRestoration methods will @c requiresSecureCoding and have a @c decodingFailurePolicy of @c NSDecodingFailurePolicySetErrorAndReturn.
    //     * Any @c restorationClass set on a window must explicitly conform to @c NSWindowRestoration.
    //
    //     This method will be called prior to any state encoding or restoration.
    //     */
    //    @MainActor func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool
    //
    //    /**
    //     @return The object capable of handling the specified intent.
    //     */
    //    @MainActor func application(_ application: NSApplication, handlerFor intent: INIntent) -> Any?
    //
    //    /**
    //     Method called by `-[NSApplication encodeRestorableStateWithCoder:]` to give the delegate a chance to encode any additional state into the @c NSCoder. If the restorable state managed by the delegate changes, you must call `-[NSApplication invalidateRestorableState]` so that it will be re-encoded. See the header `NSWindowRestoration.h` for more information.
    //     */
    //    @MainActor func application(_ app: NSApplication, willEncodeRestorableState coder: NSCoder)
    //
    //    /**
    //     Method called by `-[NSApplication restoreStateWithCoder:]` to give the delegate a chance to restore its own state, which it may decode from the @c NSCoder. See the header `NSWindowRestoration.h` for more information.
    //     */
    //    @MainActor func application(_ app: NSApplication, didDecodeRestorableState coder: NSCoder)
    //
    //    /**
    //
    //     This will be called on the main thread as soon as the user indicates they want to continue an activity in your application. The @c NSUserActivity object may not be available instantly, so use this as an opportunity to show the user that an activity will be continued shortly. Return @c YES to indicate that you are doing so. Return @c NO (or leave it unimplemented) and AppKit/UIKit will put up a default UI.
    //
    //     For each `-application:willContinueUserActivityWithType:` invocation, you are guaranteed to get exactly one invocation of `-application:continueUserActivity:restorationHandler:` on success, or `-application:didFailToContinueUserActivityWithType:error:` if an error was encountered.
    //     */
    //    @MainActor func application(_ application: NSApplication, willContinueUserActivityWithType userActivityType: String) -> Bool
    //
    //    /**
    //     This will be called on the main thread after the @c NSUserActivity object is available. Use the data you stored in the NSUserActivity object to re-create what the user was doing.
    //
    //     @return @c YES to indicate that the activity was handled. Return @c NO (or leave it unimplemented) and AppKit will attempt to continue the user activity.
    //
    //     You should create/fetch any restorable objects associated with the user activity, and pass them to the restorationHandler. They will then get the above `-restoreUserActivityState:` method invoked with the user activity. Invoking the @c restorationHandler is. It may be copied and invoked later, but must be invoked on the main thread.
    //
    //     If this user activity was created automatically by having @c NSUbiquitousDocumentUserActivityType in a @c CFBundleDocumentTypes entry, AppKit can automatically restore the NSUserActivity on OS X if NO is returned, or this method is unimplemented. It will do so by creating a document of the appropriate type using the URL stored in the userInfo under the @c NSUserActivityDocumentURLKey. The document will have `-restoreUserActivity:` called on it.
    //     */
    //    @MainActor func application(_ application: NSApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([NSUserActivityRestoring]) -> Void) -> Bool
    //
    //    /**
    //     There are instances where continuing a @c NSUserActivity may fail. This will get called on the main thread if it does so. If it is unimplemented, AppKit will present the error.
    //     */
    //    @MainActor func application(_ application: NSApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error)
    //
    //    /**
    //     This will be called on the main thread when a user activity managed by AppKit/UIKit has been updated. You should use this as a last chance to add additional data to the @c userActivity.
    //     */
    //    @MainActor func application(_ application: NSApplication, didUpdate userActivity: NSUserActivity)
    //
    //    /**
    //     This will be called on the main thread after the user indicates they want to accept a CloudKit sharing invitation in your application.
    //
    //     You should use the @c CKShareMetadata object's @c shareURL and containerIdentifier to schedule a @c CKAcceptSharesOperation, then start using the resulting @c CKShare and its associated record(s), which will appear in the @c CKContainer's shared database in a zone matching that of the record's owner.
    //     */
    //    @MainActor func application(_ application: NSApplication, userDidAcceptCloudKitShareWith metadata: CKShareMetadata)
    //
    //    /// @return @c YES if the receiving delegate object can respond to key value coding messages for a specific keyed attribute, to-one relationship, or to-many relationship.  Return @c NO otherwise.
    //    @MainActor func application(_ sender: NSApplication, delegateHandlesKey key: String) -> Bool
    //
    //    /**
    //     This method will be called once during application launch at `-[NSApplication finishLaunching]`.
    //
    //     @return @c NO if the receiving delegate object wishes to opt-out of system-wide keyboard shortcut localization for all application-supplied menus. Return @c YES by default for apps linked against 12.0 and later SDK.
    //     */
    //    @MainActor func applicationShouldAutomaticallyLocalizeKeyEquivalents(_ application: NSApplication) -> Bool
}

extension AppDelegate {
    private func traceMessage(
        function: String,
        notification: Notification
    ) -> String {
        [
            "NSApplicationDelegate.\(function)",
            {
                guard let userInfo = notification.userInfo else { return nil }
                return "userInfo: \(userInfo.description)"
            }()
        ]
            .compactMap { $0 }
            .joined(separator: "\n")
    }

}
#endif

```
