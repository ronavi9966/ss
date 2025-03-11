#!/bin/bash

# fuck sudo

DEFAULT_USER="root"

# Парсинг аргументов
if [ $# -lt 1 ]; then
    echo "ss [-u user] [command]"
    exit 1
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "run superuser command"
    echo "ss [-u user] [command]"
    echo "-u --user    specify the user"
    echo "-h --help    display help message"
    echo "-v --version display version information"
    exit 0
fi

if [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
    echo "ss ver. 1.0"
    echo "2025 Semisweet corp., CC0 1.0 Universal"
    exit 0
fi

if [ "$1" == "-u" ] || [ "$1" == "--user" ]; then
    if [ $# -lt 3 ]; then
        echo "Usage: ss [-u user] [command]"
        exit 1
    fi
    USER="$2"
    shift 2
else
    USER="$DEFAULT_USER"
fi

# Сборка команды
CMD="$@"

# Выполнение команды
su "$USER" -c "$CMD"
