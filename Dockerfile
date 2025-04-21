FROM cirrusci/flutter:latest

# Set environment variables
ENV ANDROID_SDK_ROOT /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools

# Install dependencies
RUN apt-get update && apt-get install -y unzip wget openjdk-17-jdk

# Install Android command-line tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    cd ${ANDROID_SDK_ROOT}/cmdline-tools && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip && \
    unzip tools.zip && \
    rm tools.zip && \
    mv cmdline-tools latest

# Install SDK components
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses
RUN sdkmanager --sdk_root=${ANDROID_SDK_ROOT} \
    "platform-tools" \
    "platforms;android-33" \
    "build-tools;33.0.2"

# Optional: run flutter doctor to verify setup
RUN flutter doctor
