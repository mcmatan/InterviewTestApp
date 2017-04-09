import Foundation

class CompanyService {

    // injected on AppDelegate
    var api: CompanyAPIType?

    private var company: Company!

    private var queryQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "com.dapulse.test.company_query"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    func load() {
        queryQueue.isSuspended = true
        api?.fetch { [weak self] in
            self?.company = $0

            // start all queries
            self?.queryQueue.isSuspended = false
        }
    }

    func getCompanyName(_ completion: @escaping (String)->()) {
        queryQueue.addOperation {
            DispatchQueue.main.async {
                completion(self.company.name)
            }
        }
    }

    func getEmployees(forManagerId managerId: Int? = nil, completion: @escaping ([Employee])->()) {
        queryQueue.addOperation {
            let employees = self.company.employees.filter { $0.managerId == managerId }

            DispatchQueue.main.async {
                completion(employees)
            }
        }
    }

    func getTopLevelEmployees(completion: @escaping ([Employee])->()) {
        getEmployees(forManagerId: nil, completion: completion)
    }
}
