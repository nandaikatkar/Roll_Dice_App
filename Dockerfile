FROM dart:stable AS build

# Install Flutter SDK manually to get latest
RUN apt-get update && \
    apt-get install -y unzip git curl xz-utils && \
    git clone https://github.com/flutter/flutter.git /flutter && \
    /flutter/bin/flutter doctor

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build apk --release

CMD ["bash"]
