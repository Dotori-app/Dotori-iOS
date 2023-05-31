import AuthDomain
import IQKeyboardManagerSwift
import JwtStore
import MainTabFeature
import HomeFeature
import NoticeFeature
import SelfStudyFeature
import RenewalPasswordFeature
import RootFeature
import SigninFeature
import SignupFeature
import Swinject
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static let container = Container()
    var assembler: Assembler!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        assembler = Assembler([
            JwtStoreAssembly(),
            HomeAssembly(),
            NoticeAssembly(),
            SelfStudyAssembly(),
            MainAssembly(),
            SigninAssembly(),
            SignupAssembly(),
            RenewalPasswordAssembly(),
            RootAssembly(),
            AuthDomainAssembly()
        ], container: AppDelegate.container)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {}
}
