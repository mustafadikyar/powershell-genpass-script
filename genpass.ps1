# Define parameters with support for short options
param (
    [switch]$help,       # -help parameter to show help message
    [int]$l = 16,        # -l parameter to specify length
    [string]$o = "a"     # -o parameter to specify character options
)

function Show-Help {
    Write-Host "Usage:"
    Write-Host "./genpass.ps1 -l <password length> -o <character types>"
    Write-Host "Options:"
    Write-Host "  l : Lowercase letters"
    Write-Host "  u : Uppercase letters"
    Write-Host "  d : Digits"
    Write-Host "  s : Special characters"
    Write-Host "  a : All character types"
    Write-Host "Example: ./genpass.ps1 -l 12 -o 'lds'"
}

function Generate-StrongPassword {
    param (
        [int]$length,
        [string]$options
    )
    
    # Define character sets
    $lowercase = 'abcdefghijklmnopqrstuvwxyz'
    $uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $digits = '0123456789'
    $specialChars = '!@#$%^&*()-_=+[]{}<>?'

    # Build the selected character set based on user options
    $selectedChars = ""
    if ($options -match "l" -or $options -match "a") { $selectedChars += $lowercase }
    if ($options -match "u" -or $options -match "a") { $selectedChars += $uppercase }
    if ($options -match "d" -or $options -match "a") { $selectedChars += $digits }
    if ($options -match "s" -or $options -match "a") { $selectedChars += $specialChars }
    
    # Error handling: Ensure at least one valid character set is selected
    if ($selectedChars.Length -eq 0) {
        Write-Host "Error: Please select a valid character set."
        Show-Help
        return
    }

    # Generate the password from the selected character set
    $password = -join (1..$length | ForEach-Object { $selectedChars[(Get-Random -Minimum 0 -Maximum $selectedChars.Length)] })

    return $password
}

# Show help message if -help is provided
if ($help) {
    Show-Help
    return
}

# Main script section with error handling
if ($l -lt 1) {
    Write-Host "Error: Password length cannot be less than 1."
    Show-Help
    return
}

# Generate the strong password and display it
$strongPassword = Generate-StrongPassword -length $l -options $o

Write-Host "Generated strong password: $strongPassword"
