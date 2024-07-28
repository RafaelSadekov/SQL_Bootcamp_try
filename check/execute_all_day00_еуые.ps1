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
        return $output -replace "\s+", " " -replace "\r?\n", "`n"
    }
    else {
        Write-Host "$RED Error executing $file. $NC"
        Write-Host "$output"
        return $null
    }
}

# Функция для сравнения результатов с эталонными ответами
function Compare-Results {
    param (
        [string]$output,
        [string]$referenceFile
    )
    if (Test-Path $referenceFile) {
        $referenceContent = (Get-Content $referenceFile -Raw) -replace "\s+", " " -replace "\r?\n", "`n"
        if ($output -eq $referenceContent) {
            Write-Host "$GREEN The result matches the reference answer. $NC"
        }
        else {
            Write-Host "$RED The result does not match the reference answer. $NC"
            Write-Host "Expected:"
            Write-Host "$referenceContent"
            Write-Host "Got:"
            Write-Host "$output"
        }
    }
    else {
        Write-Host "$RED Reference file $referenceFile does not exist. $NC"
    }
}

# Проходим по всем папкам ex00 до ex10 и выполняем скрипты
for ($i = 0; $i -le 10; $i++) {
    $folder = "ex" + "{0:D2}" -f $i
    $DIR = Join-Path "." $folder
    Write-Host "$GREEN Checking directory $DIR... $NC"
    if (Test-Path $DIR) {
        $fileName = "day00_ex{0:D2}.sql" -f $i
        $file = Join-Path $DIR $fileName
        $referenceFile = Join-Path $DIR "${folder}_reference.txt"
        Write-Host "$GREEN Checking file $file... $NC"
        if (Test-Path $file) {
            $output = Execute-Sql -file $file
            if ($output) {
                Compare-Results -output $output -referenceFile $referenceFile
            }
        }
        else {
            Write-Host "$RED File $file does not exist. $NC"
        }
    }
    else {
        Write-Host "$RED Directory $DIR does not exist. $NC"
    }
}
