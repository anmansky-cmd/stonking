FROM ubuntu:26.10

# Настройка метаданных
LABEL org.opencontainers.image.description="Ubuntu 26.10 image with Rockchip RK3588 MPP/RGA Hardware Decoding for NanoPC-T6"

# Предотвращает появление интерактивных окон при установке пакетов
ENV DEBIAN_FRONTEND=noninteractive

# Установка необходимых утилит и добавление PPA с Rockchip BSP драйверами
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    gnupg2 \
    curl \
    ca-certificates \
    && add-apt-repository -y ppa:jjriek/rockchip-multimedia \
    && apt-get update && apt-get upgrade -y

# Установка библиотек аппаратного ускорения Rockchip (MPP, RGA) и мультимедиа-пакетов
RUN apt-get install -y --no-install-recommends \
    rockchip-multimedia-config \
    librockchip-mpp-dev \
    librockchip-mpp1 \
    librga-dev \
    librga2 \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-rockchip \
    ffmpeg-rockchip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Настройка переменных окружения для приложений (например, Chromium/FFmpeg)
ENV LIBVA_DRIVER_NAME=rockchip
ENV LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu:$LD_LIBRARY_PATH

CMD ["/bin/bash"]
