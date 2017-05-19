FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools


RUN apt-get update -qq && \
    apt-get install -y openjdk-8-jdk-headless \
                       build-essential \
                       unzip \
                       curl \
                       gcc-multilib \
                       g++-multilib \
                       libc6-dev-i386 \
                       lib32ncurses5-dev

RUN curl -o android-sdk-tools.zip https://dl.google.com/android/repository/tools_r25.2.5-linux.zip \
    && unzip -q android-sdk-tools.zip -d ${ANDROID_HOME} \
    && rm -f android-sdk-tools.zip

# Platform tools
RUN yes 'y' | sdkmanager "platform-tools"

RUN sdkmanager "tools"
RUN sdkmanager "platforms;android-25"
RUN sdkmanager "build-tools;25.0.2"
RUN sdkmanager "extras;android;m2repository"
RUN sdkmanager "extras;google;m2repository"
RUN sdkmanager "extras;google;google_play_services"