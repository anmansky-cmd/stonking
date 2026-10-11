# Используем Ubuntu 26.10 "Stonking Stingray" в качестве базовой ОС
FROM ubuntu:26.10

# Отключаем интерактивные диалоги apt для автоматической сборки
ENV DEBIAN_FRONTEND=noninteractive

# Обновляем систему и ставим базовые зависимости (без лишних утилит вроде software-properties-common)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 \
    curl \
    ca-certificates \
    && apt-get upgrade -y \
    # Очищаем кэш пакетов для оптимизации веса Docker-образа
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Возвращаем стандартный режим интерфейса для работы внутри контейнера
ENV DEBIAN_FRONTEND=newt

# Указываем рабочую директорию вашего приложения
WORKDIR /app
