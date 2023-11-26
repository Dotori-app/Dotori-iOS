import BaseFeature
import CombineUtility
import Configure
import DesignSystem
import GlobalThirdPartyLibrary
import Localization
import MSGLayout
import UIKit
import UtilityModule

final class SigninViewController: BaseStoredViewController<SigninStore> {
    private let dotoriLogoImageView = UIImageView()
        .set(
            \.image,
            .Dotori.dotoriSigninLogo
                .withRenderingMode(.alwaysTemplate)
                .withTintColor(.dotori(.primary(.p10)))
                .resize(width: 182, height: 41)
        )
    private let dotoriSubTitle = DotoriLabel(
        "광주소프트웨어마이스터고\n기숙사 관리 시스템, DOTORI",
        textColor: .neutral(.n20),
        font: .subtitle2
    )
    private let signinButton = GAuthButton(
        auth: .signin,
        color: .colored,
        rounded: .default
    )

    override func addView() {
        view.addSubviews {
            dotoriLogoImageView
            emailTextField
            passwordTextField
            renewalPasswordButton
            signinButton
            signupButton
        }
    }

    override func setLayout() {
        MSGLayout.buildLayout {
            dotoriLogoImageView.layout
                .centerX(.toSuperview())
                .top(.to(view.safeAreaLayoutGuide).top, .equal(20))
                .height(41)

            emailTextField.layout
                .centerX(.toSuperview())
                .horizontal(.toSuperview(), .equal(20))
                .top(.to(dotoriLogoImageView).bottom, .equal(30))

            passwordTextField.layout
                .centerX(.toSuperview())
                .horizontal(.toSuperview(), .equal(20))
                .top(.to(emailTextField).bottom, .equal(8))

            renewalPasswordButton.layout
                .trailing(.to(passwordTextField).trailing)
                .top(.to(passwordTextField).bottom, .equal(8))

            signinButton.layout
                .centerX(.toSuperview())
                .horizontal(.toSuperview(), .equal(20))
                .top(.to(renewalPasswordButton).bottom, .equal(32))

            signupButton.layout
                .centerX(.toSuperview())
                .top(.to(signinButton).bottom, .equal(16))
        }
    }

    override func configureViewController() {
        self.view.backgroundColor = .dotori(.background(.card))
    }

    override func configureNavigation() {
        self.navigationItem.title = L10n.Signin.loginNavigationTitle
    }

    override func bindAction() {
        emailTextField.textPublisher
            .map(Store.Action.updateEmail)
            .sink(receiveValue: store.send(_:))
            .store(in: &subscription)

        passwordTextField.textPublisher
            .map(Store.Action.updatePassword)
            .sink(receiveValue: store.send(_:))
            .store(in: &subscription)

        signupButton.tapPublisher
            .map { Store.Action.signupButtonDidTap }
            .sink(receiveValue: store.send(_:))
            .store(in: &subscription)

        renewalPasswordButton.tapPublisher
            .map { Store.Action.renewalPasswordButtonDidTap }
            .sink(receiveValue: store.send(_:))
            .store(in: &subscription)

        signinButton.tapPublisher
            .map { Store.Action.signinButtonDidTap }
            .sink(receiveValue: store.send(_:))
            .store(in: &subscription)
    }
}
