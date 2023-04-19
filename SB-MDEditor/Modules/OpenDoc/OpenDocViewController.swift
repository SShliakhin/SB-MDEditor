import UIKit

final class OpenDocViewController: UIViewController {

	private lazy var welcomeLabel = makeWelcomeLabel()
	private lazy var errorView = ErrorView()

	// MARK: - Init
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
		applyStyle()
		setupConstraints()
	}
}

// MARK: - UI
private extension OpenDocViewController {
	func setup() {
		let testMessage = Appearance.errorMessage
		errorView.update(with: testMessage)
		errorView.show()
	}
	func applyStyle() {
		title = Appearance.title
		view.backgroundColor = Theme.color(usage: .background)
	}
	func setupConstraints() {
		[
			welcomeLabel,
			errorView
		].forEach { item in
			item.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview(item)
		}

		welcomeLabel.makeEqualToSuperviewCenter()
		errorView.makeEqualToSuperview()
	}
}

// MARK: - UI make
private extension OpenDocViewController {
	func makeWelcomeLabel() -> UILabel {
		let label = UILabel()
		label.text = Appearance.welcomeText
		label.textColor = Theme.color(usage: .main)
		label.font = Theme.font(style: .preferred(style: .title1))
		return label
	}
}

// MARK: - Appearance
private extension OpenDocViewController {
	enum Appearance {
		static let welcomeText = "Welcome to Open Doc"
		static let title = "Open Doc"
		static let errorMessage = ErrorInputData(
			emoji: "🙈",
			message: "Переход к экрану: Создать документ"
		) {
			if
				let rootVC = UIApplication.shared.windows.first?.rootViewController as? IRootViewController,
				let newModule = rootVC.factory?.makeCreateDocModule() {
				rootVC.navigate(to: newModule)
			}
		}
	}
}
