import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.AuthDomain.rawValue,
    targets: [
        .interface(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface),
            .SPM.GAuthSignin
        ]),
        .implements(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .AuthDomain, type: .interface),
            .domain(target: .BaseDomain),
            .SPM.GAuthSignin
        ]),
        .testing(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .AuthDomain, type: .interface)
        ]),
        .tests(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .AuthDomain),
            .domain(target: .AuthDomain, type: .testing)
        ])
    ]
)
