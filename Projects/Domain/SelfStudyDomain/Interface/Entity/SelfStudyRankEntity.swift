import Foundation

public struct SelfStudyRankEntity: Equatable {
    public let id: Int
    public let rank: Int
    public let stuNum: String
    public let memberName: String
    public let gender: GenderType
    public let selfStudyCheck: Bool

    public init(
        id: Int,
        rank: Int,
        stuNum: String,
        memberName: String,
        gender: GenderType,
        selfStudyCheck: Bool
    ) {
        self.id = id
        self.rank = rank
        self.stuNum = stuNum
        self.memberName = memberName
        self.gender = gender
        self.selfStudyCheck = selfStudyCheck
    }
}