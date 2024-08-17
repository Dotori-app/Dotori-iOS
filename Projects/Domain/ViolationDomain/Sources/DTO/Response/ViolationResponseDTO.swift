import BaseDomainInterface
import DateUtility
import Foundation
import ViolationDomainInterface

struct ViolationResponseDTO: Decodable {
    let id: Int
    let rule: ViolationType
    let createdDate: String
}

extension ViolationResponseDTO {
    func toDomain() -> ViolationEntity {
        ViolationEntity(
            id: id,
            rule: rule,
            createDate: createdDate.toDateWithCustomFormat("yyyy-MM-dd")
        )
    }
}
