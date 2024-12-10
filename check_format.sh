#!/bin/bash
echo "Проверка формата .txt файлов..."

files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.txt$')

for file in $files; do
    if grep '.\{81\}' "$file"; then
        echo "Ошибка: Файл '$file' содержит строки длиннее 80 символов."
        exit 1
    fi
done

echo "Все .txt файлы прошли проверку формата."
exit 0
