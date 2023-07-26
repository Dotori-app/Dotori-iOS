import MusicDomainInterface
import NetworkingInterface
import Swinject

public final class MusicDomainAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
        container.register(RemoteMusicDataSource.self) { resolver in
            RemoteMusicDataSourceImpl(networking: resolver.resolve(Networking.self)!)
        }
        .inObjectScope(.container)

        container.register(MusicRepository.self) { resolver in
            MusicRepositoryImpl(remoteMusicDataSource: resolver.resolve(RemoteMusicDataSource.self)!)
        }
        .inObjectScope(.container)

        container.register(FetchMusicListUseCase.self) { resolver in
            FetchMusicListUseCaseImpl(musicRepository: resolver.resolve(MusicRepository.self)!)
        }
    }
}