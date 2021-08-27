# Handtracking App

**Create a custom Framework for iOS app based on mediapipe**

-----

### Create Framework based on mediapipe

1. Get the mediapipe project

```
git clone https://github.com/google/mediapipe.git
```
2. Create System Link between current project and mediapipe
```bash
ln -s  /Users/philippschwarz/Documents/PoseDetectionApp/handtracking_app/handmodelframework/ /Users/philippschwarz/Documents/PoseDetectionApp/mediapipe/mediapipe/examples/ios
```
3. Run bazel command:
```
➜  mediapipe git:(master) ✗ bazel build -c opt --config=ios_arm64 mediapipe/examples/ios/posetrackingframework:PoseTracker
```
3. Copy Hand Tracking Framework
```
unzip /Users/philippschwarz/Documents/PoseDetectionApp/mediapipe/bazel-out/ios_arm64-opt/bin/mediapipe/examples/ios/handmodelframework/HandTracker.zip
```

```
cp -rf
/Users/philippschwarz/Documents/PoseDetectionApp/mediapipe/bazel-out/ios_arm64-opt/bin/mediapipe/examples/ios/handmodelframework/HandTracker.framework
/Users/philippschwarz/Documents/PoseDetectionApp/handtracking_app/
```
### Build app and deploy on IPhone!

1. Connect IPhone to computer 

2. Select own iPhone and click build & run 
------

### What is MediaPipe?

MediaPipe offers cross-platform, customizable ML solutions for live and streaming media.

- End-to-End acceleration: Built-in fast ML inference and processing accelerated even on common hardware
- Build once, deploy anywhere: Unified solution works across Android, iOS, desktop/cloud, web and IoT
- Ready-to-use solutions: Cutting-edge ML solutions demonstrating full power of the framework
- Free and open source: Framework and solutions both under Apache 2.0, fully extensible and customizable

------

DEBUG ISSUES:

0. Provisioning profile expired
XCode -> Preferences -> Accounts -> Manage Certificates -> Create a Certificate 

1. Problem with Signing Bundle Identifier
In Project Settings select:
Automatically manage signing

3. When bazel BUILD does not work, hard code Bundle ID
BUNDLE_ID_PREFIX = "706dda39-c9bb-4314-830d-327203248742.mediapipe.examples"


## License
**handtracking_app** is available under the MIT license. See the [LICENSE](LICENSE) file for more info.