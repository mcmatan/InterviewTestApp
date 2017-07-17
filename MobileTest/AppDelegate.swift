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

        
        c.register(ManagerScreen.self) { r in
            let controller = ManagerScreen(nibName: nil, bundle: nil)
            controller.companyService = r.resolve(CompanyService.self)
            return controller
        }
        
        c.register(MainScreenController.self) { r in
            let controller = MainScreenController(nibName: nil, bundle: nil)
            controller.companyService = r.resolve(CompanyService.self)
            controller.managerScreen = r.resolve(ManagerScreen.self)
            return controller
        }
        
    
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window

        // Instantiate the root view controller with dependencies injected by the container.
        
        let nav = UINavigationController(rootViewController: container.resolve(MainScreenController.self)!)
        window.rootViewController = nav

        return true
    }
}

