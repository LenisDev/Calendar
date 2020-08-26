// swift-tools-version:5.1
import PackageDescription

let package = Package(name: "Calendar",
                      platforms: [.iOS(.v10)],
                      products: [.library(name: "Calendar",
                                          targets: ["Calendar"])],
                      targets: [.target(name: "Calendar",
                                        path: "Calendar/Calendar"),
                                .testTarget(name: "CalendarTests",
                                            dependencies: ["Calendar"],
                                            path: "Calendar/CalendarTests")],
                      swiftLanguageVersions: [.v5])
