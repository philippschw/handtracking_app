load("@build_bazel_rules_apple//apple:ios.bzl", "ios_framework")

ios_framework(
    name = "HandTracker",
    hdrs = [
        "HandTracker.h",
    ],
    infoplists = ["Info.plist"],
    bundle_id = "706dda39-c9bb-4314-830d-327203248742.mediapipe.examples.PoseTrackingGpu",
    families = ["iphone", "ipad"],
    minimum_os_version = "12.0",
    deps = [
        ":HandTrackerLibrary",
        "@ios_opencv//:OpencvFramework",
    ],
)

objc_library(
    name = "HandTrackerLibrary",
    srcs = [
        "HandTracker.mm",
    ],
    hdrs = [
        "HandTracker.h",
    ],
    copts = ["-std=c++17"],
    data = [
        "//mediapipe/graphs/hand_tracking:hand_tracking_mobile_gpu_binary_graph",
        "//mediapipe/modules/palm_detection:palm_detection.tflite",
        "//mediapipe/modules/hand_landmark:hand_landmark.tflite",
        "//mediapipe/modules/hand_landmark:handedness.txt",
    ],
    sdk_frameworks = [
        "AVFoundation",
        "CoreGraphics",
        "CoreMedia",
        "UIKit"
    ],
    deps = [
        "//mediapipe/objc:mediapipe_framework_ios",
        "//mediapipe/objc:mediapipe_input_sources_ios",
        "//mediapipe/objc:mediapipe_layer_renderer",
    ] + select({
        "//mediapipe:ios_i386": [],
        "//mediapipe:ios_x86_64": [],
        "//conditions:default": [
            "//mediapipe/graphs/hand_tracking:mobile_calculators",
            "//mediapipe/framework/formats:landmark_cc_proto",
        ],
    }),
)
