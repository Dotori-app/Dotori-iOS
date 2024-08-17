import BaseDomainInterface
import BaseFeature
import DateUtility
import DesignSystem
import Localization
import MSGLayout
import UIKit
import ViolationDomainInterface

final class ViolationCell: BaseTableViewCell<ViolationModel> {
    private enum Metric {
        static let padding: CGFloat = 16
    }

    private let containerView = UIView()
        .set(\.backgroundColor, .dotori(.background(.bg)))
        .set(\.cornerRadius, 8)
    private let violationTitleLabel = DotoriLabel(font: .body1)
        .set(\.numberOfLines, 0)
    private let dateLabel = DotoriLabel(textColor: .neutral(.n20), font: .body2)

    override func addView() {
        contentView.addSubviews {
            containerView
        }
    }

    override func setLayout() {
        MSGLayout.buildLayout {
            containerView.layout
                .vertical(.toSuperview(), .equal(5))
                .horizontal(.toSuperview())
        }
        MSGLayout.stackedLayout(self.containerView) {
            HStackView {
                violationTitleLabel

                SpacerView()

                dateLabel
            }
            .margin(.all(Metric.padding))
            .alignment(.center)
        }
    }

    override func configureView() {
        self.selectionStyle = .none
    }

    override func adapt(model: ViolationModel) {
        self.violationTitleLabel.text = model.rule.toViolationString
        self.dateLabel.text = model.createDate.toStringWithCustomFormat("yyyy.MM.dd")
    }
}

private extension ViolationType {
    var toViolationString: String {
        switch self {
        case .firearms: return L10n.ViolationHistory.firearms
        case .weapon: return L10n.ViolationHistory.weapon
        case .alcohol: return L10n.ViolationHistory.alcohol
        case .tobacco: return L10n.ViolationHistory.tobacco
        case .meanderingApparatus: return L10n.ViolationHistory.meanderingApparatus
        case .food: return L10n.ViolationHistory.food
        case .useFirearms: return L10n.ViolationHistory.useFirearms
        case .useWeapon: return L10n.ViolationHistory.useWeapon
        case .drinkingAlcohol: return L10n.ViolationHistory.drinkingAlcohol
        case .useTobacco: return L10n.ViolationHistory.useTobacco
        case .useMeanderingApparatus: return L10n.ViolationHistory.useMeanderingApparatus
        case .eatFood: return L10n.ViolationHistory.eatFood
        case .managerGuidance: return L10n.ViolationHistory.managerGuidance
        case .time: return L10n.ViolationHistory.time
        case .outing: return L10n.ViolationHistory.outing
        case .overnightStay: return L10n.ViolationHistory.overnightStay
        case .damageOfGoods: return L10n.ViolationHistory.damageOfGoods
        case .theft: return L10n.ViolationHistory.theft
        case .chantage: return L10n.ViolationHistory.chantage
        case .disturbingSleep: return L10n.ViolationHistory.disturbingSleep
        case .electronicDevice: return L10n.ViolationHistory.electronicDevice
        case .loud: return L10n.ViolationHistory.loud
        case .incorrectEntry: return L10n.ViolationHistory.incorrectEntry
        case .laundry: return L10n.ViolationHistory.laundry
        case .violationOfTheUseOfFacilities: return L10n.ViolationHistory.violationOfTheUseOfFacilities
        case .damageOfPost: return L10n.ViolationHistory.damageOfPost
        case .possessionOfElectronicsDevices: return L10n.ViolationHistory.possessionOfElectronicsDevices
        case .cleanCounditionBad: return L10n.ViolationHistory.cleanCounditionBad
        case .environmentPollution: return L10n.ViolationHistory.environmentPollution
        case .affectionateAct: return L10n.ViolationHistory.affectionateAct
        case .sexualAct: return L10n.ViolationHistory.sexualAct
        case .entryToProhibitedAreas: return L10n.ViolationHistory.entryToProhibitedAreas
        case .violationOfStudyRoomRules: return L10n.ViolationHistory.violationOfStudyRoomRules
        case .outsiderEntry: return L10n.ViolationHistory.outsiderEntry
        case .none: return L10n.ViolationHistory.none
        }
    }
}
