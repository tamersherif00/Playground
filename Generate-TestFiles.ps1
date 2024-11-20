# This script creates random files of varying sizes and types across three directories:
# - SmallFiles (100 KB, 500 KB, 1024 KB)
# - MediumFiles (10240 KB, 51200 KB, 102400 KB)
# - LargeFiles (204800 KB, 512000 KB, 1048576 KB)
# File types in each directory are diversified, with different extensions for small, medium, and large files.
# The script ensures that the created files are not zero bytes by checking the file size before creation.
#
# To modify:
# - **File sizes**: Change the values in the `$smallSizes`, `$mediumSizes`, and `$largeSizes` arrays.
# - **Number of files per directory**: Adjust the range in the `1..1000`, `1..100`, and `1..20` loops for small, medium, and large files, respectively.


# Define directory paths
$smallFilesDir = "D:\Test\SmallFiles"
$mediumFilesDir = "D:\Test\MediumFiles"
$largeFilesDir = "D:\Test\LargeFiles"

# Create directories if they do not exist
New-Item -Path $smallFilesDir -ItemType Directory -Force
New-Item -Path $mediumFilesDir -ItemType Directory -Force
New-Item -Path $largeFilesDir -ItemType Directory -Force

# Function to create a random file of a specific size
Function New-RandomFile {
    param(
        [string]$filePath,
        [int]$fileSizeKB
    )

    # Check if file size is greater than zero to avoid 0-byte files
    if ($fileSizeKB -gt 0) {
        # Create random bytes and write them to a file
        $randomData = New-Object byte[] ($fileSizeKB)  # Size in KB (1 byte = 1 byte)
        [System.IO.File]::WriteAllBytes($filePath, $randomData)
    } else {
        Write-Warning "File size is zero, skipping file creation for $filePath"
    }
}

# Create small files (100 KB, 500 KB, 1024 KB)
$smallSizes = @(100KB, 500KB, 1024KB)  # Sizes in KB
$smallFileTypes = @("txt", "csv", "jpg", "json", "xml")  # File types
1..1000 | ForEach-Object {
    $size = $smallSizes | Get-Random
    $fileType = $smallFileTypes | Get-Random
    $fileName = "file$_.${fileType}"
    $filePath = Join-Path $smallFilesDir $fileName
    New-RandomFile -filePath $filePath -fileSizeKB $size
}

# Create medium files (10240 KB, 51200 KB, 102400 KB)
$mediumSizes = @(10240KB, 51200KB, 102400KB)  # Sizes in KB (equivalent to 10 MB, 50 MB, 100 MB)
$mediumFileTypes = @("pdf", "mp4", "zip", "txt", "docx")  # File types
1..100 | ForEach-Object {
    $size = $mediumSizes | Get-Random
    $fileType = $mediumFileTypes | Get-Random
    $fileName = "doc$_.${fileType}"
    $filePath = Join-Path $mediumFilesDir $fileName
    New-RandomFile -filePath $filePath -fileSizeKB $size
}

# Create large files (204800 KB, 512000 KB, 1048576 KB)
$largeSizes = @(204800KB, 512000KB, 1048576KB)  # Sizes in KB (equivalent to 200 MB, 500 MB, 1 GB)
$largeFileTypes = @("bak", "iso", "tar", "img", "vhd")  # File types
1..20 | ForEach-Object {
    $size = $largeSizes | Get-Random
    $fileType = $largeFileTypes | Get-Random
    $fileName = "backup$_.${fileType}"
    $filePath = Join-Path $largeFilesDir $fileName
    New-RandomFile -filePath $filePath -fileSizeKB $size
}

Write-Host "File creation complete."
