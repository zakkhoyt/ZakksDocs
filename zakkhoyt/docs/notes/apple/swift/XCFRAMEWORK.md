https://developer.apple.com/videos/play/wwdc2020/10147/
https://developer.apple.com/videos/play/wwdc2019/416/


https://www.appcoda.com/xcframework/
https://help.apple.com/xcode/mac/11.4/#/dev544efab96
https://developer.apple.com/documentation/xcode/creating-a-standalone-swift-package-with-xcode
https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages

https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages

https://forums.swift.org/t/issue-with-third-party-dependencies-inside-a-xcframework-through-spm/41977/2


xcodebuild archive \
    -scheme ArgumentKit \
    -destination "generic/platform=iOS" \
    -archivePath archive/ArgumentKit/ArgumentKit-iOS \
    -workspace Nightlight.xcworkspace \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme ArgumentKit \
    -destination "generic/platform=iOS Simulator" \
    -archivePath archive/ArgumentKit/ArgumentKit-iOS_Simulator \
    -workspace Nightlight.xcworkspace \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES


xcodebuild archive \
    -scheme HatchBrain \
    -destination "generic/platform=iOS" \
    -archivePath archive/HatchBrain/HatchBrain-iOS \
    -workspace Nightlight.xcworkspace \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES;

xcodebuild archive \
    -scheme HatchBrain \
    -destination "generic/platform=iOS Simulator" \
    -archivePath archive/HatchBrain/HatchBrain-iOS_Simulator \
    -workspace Nightlight.xcworkspace \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES;

# The problem is that we need the above to output a framework, not .o files. There is no such framework:
`archive/ArgumentKit-iOS.xcarchive/Products/Library/Frameworks/ArgumentKit-iOS.framework`

xcodebuild archive \
    -scheme HatchBinary \
    -destination "generic/platform=iOS" \
    -archivePath archive/HatchBinary/HatchBinary-iOS \
    -workspace Nightlight.xcworkspace \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES;

xcodebuild archive \
    -scheme HatchBinary \
    -destination "generic/platform=iOS Simulator" \
    -archivePath archive/HatchBinary/HatchBinary-iOS_Simulator \
    -workspace Nightlight.xcworkspace \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES;

xcodebuild -create-xcframework \
    -framework archive/HatchBinary-iOS.xcarchive/Products/Library/Frameworks/HatchBinary-iOS.framework \
    -framework archive/HatchBinary-iOS_Simulator.xcarchive/Products/Library/Frameworks/HatchBinary-iOS_Simulator.framework \
    -output ./HatchBinary.xcframework;





xcodebuild archive \
    -scheme HatchBinary \
    -destination "generic/platform=iOS" \
    -archivePath archive/HatchBinary/HatchBinary-iOS \
    -project HatchBinary.xcodeproj \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES;

xcodebuild archive \
    -scheme HatchBinary \
    -destination "generic/platform=iOS Simulator" \
    -archivePath archive/HatchBinary/HatchBinary-iOS_Simulator \
    -project HatchBinary.xcodeproj \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES;

xcodebuild -create-xcframework \
    -framework archive/HatchBinary-iOS.xcarchive/Products/Library/Frameworks/HatchBinary-iOS.framework \
    -framework archive/HatchBinary-iOS_Simulator.xcarchive/Products/Library/Frameworks/HatchBinary-iOS_Simulator.framework \
    -output archive/HatchBinary.xcframework;
