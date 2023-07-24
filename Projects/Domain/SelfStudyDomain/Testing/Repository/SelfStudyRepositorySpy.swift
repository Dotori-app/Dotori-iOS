import SelfStudyDomainInterface

final class SelfStudyRepositorySpy: SelfStudyRepository {
    var fetchSelfStudyInfoCallCount = 0
    var fetchSelfStudyInfoReturn: SelfStudyInfoEntity = .init(count: 0, limit: 0, selfStudyStatus: .can)
    func fetchSelfStudyInfo() async throws -> SelfStudyInfoEntity {
        fetchSelfStudyInfoCallCount += 1
        return fetchSelfStudyInfoReturn
    }

    var applySelfStudyCallCount = 0
    func applySelfStudy() async throws {
        applySelfStudyCallCount += 1
    }

    var fetchSelfStudyRankListCallCount = 0
    var fetchSelfStudyRankListReturn: [SelfStudyRankEntity] = []
    func fetchSelfStudyRankList() async throws -> [SelfStudyRankEntity] {
        fetchSelfStudyRankListCallCount += 1
        return fetchSelfStudyRankListReturn
    }
}
