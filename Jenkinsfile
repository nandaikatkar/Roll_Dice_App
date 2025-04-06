pipeline {
    agent any

    environment {
        PATH = "/opt/flutter/bin:/usr/lib/android-sdk/platform-tools:/usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin:$PATH"
        ANDROID_HOME = "/usr/lib/android-sdk"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/nandaikatkar/Roll_Dice_App.git'
            }
        }
        stage('Flutter Pub Get') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('Analyze') {
            steps {
                sh 'flutter analyze'
            }
        }
        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
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
