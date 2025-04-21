# Dockerfile

FROM cirrusci/flutter:latest

WORKDIR /app

COPY . .

RUN flutter pub get

RUN flutter build apk --release

CMD ["bash"]
