ARG android_sdk_ver=34
FROM ghcr.io/cirruslabs/android-sdk:${android_sdk_ver}

ARG flutter_ver=3.19.4
ARG build_rev=0

# Install Flutter
ENV FLUTTER_HOME=/usr/local/flutter \
    FLUTTER_VERSION=${flutter_ver} \
    PATH=$PATH:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends --no-install-suggests ca-certificates
RUN update-ca-certificates

RUN apt-get install -y --no-install-recommends --no-install-suggests build-essential clang cmake lcov libgtk-3-dev liblzma-dev ninja-build pkg-config

RUN curl -fL -o /tmp/flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${flutter_ver}-stable.tar.xz
RUN tar -xf /tmp/flutter.tar.xz -C /usr/local/
RUN git config --global --add safe.directory /usr/local/flutter
RUN flutter config --enable-android
RUN flutter precache --universal --linux --web --no-ios
RUN yes | flutter doctor --android-licenses
RUN flutter --version

RUN flutter pub add firebase_core
RUN flutter pub add get
RUN flutter pub get

RUN rm -rf /var/lib/apt/lists/* /tmp/*
