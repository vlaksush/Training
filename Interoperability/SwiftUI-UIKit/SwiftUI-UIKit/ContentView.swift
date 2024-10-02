import SwiftUI
import UIKit

// MARK: - SwiftUI Views

struct ContentView: View {
    @State private var showUIKitView = false
    
    var body: some View {
        VStack {
            Text("SwiftUI View")
                .font(.largeTitle)
            
            Button("Show UIKit View") {
                showUIKitView = true
            }
        }
        .sheet(isPresented: $showUIKitView) {
            UIKitViewControllerRepresentable()
        }
    }
}

struct UIKitViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIKitViewController {
        UIKitViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIKitViewController, context: Context) {}
}

struct SwiftUIView: View {
    let dismiss: () -> Void
    
    var body: some View {
        VStack {
            Text("SwiftUI View presented from UIKit")
                .font(.headline)
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

// MARK: - UIKit ViewControllers

class UIKitViewController: UIViewController {
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }
    
    private func setupButton() {
        button.setTitle("Show SwiftUI View", for: .normal)
        button.addTarget(self, action: #selector(showSwiftUIView), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func showSwiftUIView() {
        let swiftUIView = SwiftUIView {
            self.dismiss(animated: true, completion: nil)
        }
        let hostingController = UIHostingController(rootView: swiftUIView)
        present(hostingController, animated: true, completion: nil)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
