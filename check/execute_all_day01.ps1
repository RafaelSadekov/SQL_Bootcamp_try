# Настройки базы данных
$DB_USER = "postgres"
$DB_NAME = "school"
$PSQL_PATH = "C:\Program Files\PostgreSQL\16\pgAdmin 4\runtime\psql.exe"

# Переменные для цвета текста
$RED = "`e[31m"
$GREEN = "`e[32m"
$NC = "`e[0m" # No Color

# Запрос пароля один раз
$DB_PASSWORD = Read-Host -AsSecureString "Enter password for user $DB_USER"

# Преобразование защищенной строки в обычный текст
$DB_PASSWORD_PLAIN = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($DB_PASSWORD))

# Установка пароля в переменную окружения
$env:PGPASSWORD = $DB_PASSWORD_PLAIN

# Функция для выполнения скриптов
function Execute-Sql {
    param (
        [string]$file
    )
    Write-Host "$GREEN Executing $file... $NC"
    $output = & $PSQL_PATH -h localhost -p 5433 -U $DB_USER -d $DB_NAME -f $file 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$GREEN Execution of $file completed successfully. $NC"
        if ($output) {
            $output | Format-Table -AutoSize -Wrap
        }
    }
    else {
        Write-Host "$RED Error executing $file. $NC"
        Write-Host "$output"
    }
}

# Проходим по всем папкам ex00 до ex10 и выполняем скрипты
for ($i = 0; $i -le 10; $i++) {
    $folder = "ex" + "{0:D2}" -f $i
    $DIR = Join-Path "." $folder
    Write-Host "$GREEN Checking directory $DIR... $NC"
    if (Test-Path $DIR) {
        $fileName = "day01_ex{0:D2}.sql" -f $i
        $file = Join-Path $DIR $fileName
        Write-Host "$GREEN Checking file $file... $NC"
        if (Test-Path $file) {
            Execute-Sql -file $file
        }
        else {
            Write-Host "$RED File $file does not exist. $NC"
        }
    }
    else {
        Write-Host "$RED Directory $DIR does not exist. $NC"
    }
}
