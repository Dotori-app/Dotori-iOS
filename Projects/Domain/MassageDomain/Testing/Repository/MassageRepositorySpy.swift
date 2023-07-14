import MassageDomainInterface

final class MassageRepositorySpy: MassageRepository {
    var fetchMassageInfoCallCount = 0
    var fetchMassageInfoReturn: MassageInfoEntity = .init(count: 0, limit: 0, massageStatus: .can)

    func fetchMassageInfo() async throws -> MassageInfoEntity {
        fetchMassageInfoCallCount += 1
        return fetchMassageInfoReturn
    }
}
