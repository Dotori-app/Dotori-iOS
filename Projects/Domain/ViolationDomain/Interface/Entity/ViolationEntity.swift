import BaseDomainInterface
import Foundation

public struct ViolationEntity: Equatable {
    public let id: Int
    public let rule: ViolationType
    public let createDate: Date

    public init(
        id: Int,
        rule: ViolationType,
        createDate: Date
    ) {
        self.id = id
        self.rule = rule
        self.createDate = createDate
    }
}
