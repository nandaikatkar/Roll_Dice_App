FROM cirrusci/flutter:latest

# Set environment variables
ENV ANDROID_SDK_ROOT /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools

# Install dependencies
RUN apt-get update && apt-get install -y unzip wget openjdk-17-jdk git

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

# Add jenkins user (UID 122, GID 124 to match Jenkins container run)
RUN groupadd -g 124 jenkins && useradd -m -u 122 -g jenkins jenkins

# Grant permissions to flutter SDK and Android SDK
RUN chown -R jenkins:jenkins /sdks /opt/android-sdk

# Set safe Git directory globally
RUN git config --system --add safe.directory /sdks/flutter

# Set working directory
USER jenkins
WORKDIR /home/jenkins/app

# Optional: flutter doctor
RUN flutter doctor
