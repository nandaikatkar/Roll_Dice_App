FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk android-sdk wget && \
    rm -rf /var/lib/apt/lists/*

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:$PATH"

# Accept Android licenses
RUN mkdir -p /root/.android/ && touch /root/.android/repositories.cfg
RUN yes | /flutter/bin/flutter doctor --android-licenses

# Install Android SDK components
ENV ANDROID_HOME="/sdk"
ENV PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

RUN mkdir -p "$ANDROID_HOME" && \
    yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Set up working dir and build
WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build apk --release

CMD ["bash"]
