FROM ubuntu:22.04

# Install required packages
RUN apt-get update && apt-get install -y \
  curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget && \
  rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

# Install Android SDK cmdline-tools
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && \
    cd $ANDROID_SDK_ROOT/cmdline-tools && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip && \
    unzip tools.zip && rm tools.zip && \
    mv cmdline-tools latest

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:$PATH"

# Accept licenses
RUN yes | /flutter/bin/flutter doctor --android-licenses

# Install SDK packages
RUN sdkmanager --sdk_root=${ANDROID_SDK_ROOT} \
  "platform-tools" \
  "platforms;android-33" \
  "build-tools;33.0.2"

# Set workdir
WORKDIR /app
COPY . .

# Run Flutter build
RUN flutter pub get
RUN flutter build apk --release

CMD ["/bin/bash"]
