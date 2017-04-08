import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let container = Container() { c in
        c.register(CompanyAPIType.self) { _ in CompanyAPI() }
            .inObjectScope(.container)

        c.register(CompanyService.self) { r in
                let service = CompanyService()
                service.api = r.resolve(CompanyAPIType.self)
                service.load()
                return service
            }
            .inObjectScope(.container)

        // this is how you should sign your view controllers to have the service when it's needed
        c.register(ViewController.self) { r in
            let controller = ViewController(nibName: nil, bundle: nil)
            controller.companyService = r.resolve(CompanyService.self)
            return controller
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window

        // Instantiate the root view controller with dependencies injected by the container.
        window.rootViewController = container.resolve(ViewController.self)

        return true
    }
}

