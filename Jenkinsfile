pipeline {
    agent any

    environment {
        // Set all required paths
        PATH = "/opt/flutter/bin:/usr/lib/android-sdk/platform-tools:/usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin:${env.PATH}"
        ANDROID_SDK_ROOT = "/usr/lib/android-sdk"
        ANDROID_HOME = "/usr/lib/android-sdk"
        ANDROID_NDK_HOME = "/usr/lib/android-sdk/ndk/26.3.11579264"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "📥 Cloning repository"
                git branch: 'main', url: 'https://github.com/nandaikatkar/Roll_Dice_App.git'
            }
        }

        stage('Flutter Pub Get') {
            steps {
                echo "📦 Running flutter pub get"
                sh 'flutter pub get'
            }
        }

        stage('Analyze') {
            steps {
                echo "🔍 Running flutter analyze"
                sh 'flutter analyze'
            }
        }

        stage('Build APK') {
            steps {
                echo "🛠️ Building APK"
                sh '''
                    echo "NDK Path: $ANDROID_NDK_HOME"
                    echo "SDK Path: $ANDROID_SDK_ROOT"
                    flutter build apk --release
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build Successful!'
        }
        failure {
            echo '❌ Build Failed.'
        }
    }
}













// pipeline {
//     agent any

//     environment {
//         // Clean PATH setup — only once
//         PATH = "/opt/flutter/bin:/usr/lib/android-sdk/platform-tools:/usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin:${env.PATH}"
//         ANDROID_NDK_HOME = "/usr/lib/android-sdk/ndk/26.3.11579264"
//     }

//     stages {
//         stage('Checkout') {
//              steps {
//                  git branch: 'main', url: 'https://github.com/nandaikatkar/Roll_Dice_App.git'
//              }
//          }
//         stage('Flutter Pub Get') {
//             steps {
//                 echo "📦 Running flutter pub get"
//                 sh 'flutter pub get'
//             }
//         }

//         stage('Analyze') {
//             steps {
//                 echo "🔍 Running flutter analyze"
//                 sh 'flutter analyze'
//             }
//         }

//         stage('Build APK') {
//             steps {
//                 echo "🛠️ Building APK"
//                 sh 'flutter build apk'
//             }
//         }
//     }

//     post {
//         failure {
//             echo "❌ Build Failed."
//         }
//         success {
//             echo "✅ Build Successful!"
//         }
//     }
// }


// pipeline {
//     agent any

//     environment {
//         PATH = "/opt/flutter/bin:/usr/lib/android-sdk/platform-tools:/usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin:$PATH"
//        // PATH+EXTRA = "/opt/flutter/bin:/usr/lib/android-sdk/platform-tools:/usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin"
//         ANDROID_HOME = "/usr/lib/android-sdk"
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/nandaikatkar/Roll_Dice_App.git'
//             }
//         }

//         stage('Flutter Pub Get') {
//             steps {
//                 sh '''
//                 #!/bin/bash
//                 flutter pub get
//                 '''
//             }
//         }

//         stage('Analyze') {
//             steps {
//                 sh '''
//                 #!/bin/bash
//                 flutter analyze
//                 '''
//             }
//         }

//         stage('Build APK') {
//             steps {
//                 sh '''
//                 #!/bin/bash
//                 flutter build apk --release
//                 '''
//             }
//         }
//     }

//     post {
//         success {
//             echo '✅ Build Successful!'
//         }
//         failure {
//             echo '❌ Build Failed.'
//         }
//     }
// }