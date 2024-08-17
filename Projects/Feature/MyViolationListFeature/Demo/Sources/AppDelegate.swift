import Inject
@testable import MyViolationListFeature
import UIKit
@testable import ViolationDomainTesting

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let fetchMyViolationListUseCase = FetchMyViolationListUseCaseSpy()
        fetchMyViolationListUseCase.fetchMyViolationListHandler = {
            [
                .init(id: 1, rule: .firearms, createDate: .init()),
                .init(id: 2, rule: .alcohol, createDate: .init()),
                .init(id: 2, rule: .cleanCounditionBad, createDate: .init())
            ]
        }
        let store = MyViolationListStore(
            fetchMyViolationListUseCase: fetchMyViolationListUseCase
        )
        let viewController = Inject.ViewControllerHost(
            MyViolationListViewController(store: store)
        )
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}
