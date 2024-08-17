@testable import ViolationDomain
import ViolationDomainInterface
@testable import ViolationDomainTesting
import XCTest

final class FetchMyViolationListUseCaseTests: XCTestCase {
    var violationRepository: ViolationRepositorySpy!
    var sut: FetchMyViolationListUseCaseImpl!

    override func setUp() {
        violationRepository = .init()
        sut = .init(violationRepository: violationRepository)
    }

    override func tearDown() {
        violationRepository = nil
        sut = nil
    }

    func test_FetchMyViolationList() async throws {
        let expected: [ViolationModel] = [
            ViolationModel(id: 1, rule: .firearms, createDate: .init())
        ]
        violationRepository.fetchMyViolationListHandler = { expected }
        XCTAssertEqual(violationRepository.fetchMyViolationListCallCount, 0)

        let actual = try await sut()

        XCTAssertEqual(violationRepository.fetchMyViolationListCallCount, 1)
        XCTAssertEqual(actual, expected)
    }
}
