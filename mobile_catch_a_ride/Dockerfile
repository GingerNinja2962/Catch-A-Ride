FROM ubuntu:20.04

ENV ZA=Africa/Johannesburg
ENV USER="Henry"
RUN ln -snf /usr/share/zoneinfo/$ZA /etc/localtime && echo $ZA > /etc/timezone

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget sudo

# Set up new user with sudo access
RUN useradd -ms /bin/bash $USER && echo "$USER:$USER" | chpasswd && adduser $USER sudo
USER $USER
WORKDIR /home/$USER

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/Henry/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/Henry/Android/sdk/platform-tools"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/Henry/flutter/bin"

# Run basic check to download Dark SDK
RUN flutter doctor

# Copy over project files
RUN mkdir mobile_catch_a_ride
COPY ./ mobile_catch_a_ride
RUN echo "$USER" | sudo -S chown -R $USER:$USER ./mobile_catch_a_ride
RUN cd mobile_catch_a_ride && flutter test
