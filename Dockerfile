FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
  curl unzip xz-utils zip libglu1-mesa openjdk-17-jdk git wget && \
  rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:/flutter/bin

# Install Android SDK command line tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    cd ${ANDROID_SDK_ROOT}/cmdline-tools && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip && \
    unzip tools.zip && rm tools.zip && \
    mv cmdline-tools latest

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:$PATH"

# Run Flutter doctor to fetch dependencies
RUN flutter doctor

# Accept licenses
RUN yes | flutter doctor --android-licenses

# Install required SDK packages
RUN sdkmanager --sdk_root=${ANDROID_SDK_ROOT} \
    "platform-tools" \
    "platforms;android-33" \
    "build-tools;33.0.2"

# Create project directory
WORKDIR /app

# Copy source code
COPY . .

# Get dependencies and build release APK
RUN flutter pub get
RUN flutter build apk --release

CMD ["/bin/bash"]
