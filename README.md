his PowerShell script is designed to simulate a file system with a variety of file sizes and types, which is useful for testing storage, performance, backup processes, or antivirus scans.

🔍 Script Overview
The script creates random content files in three categories:

📁 1. Directories
Creates these folders if they don’t already exist:

D:\Test\SmallFiles

D:\Test\MediumFiles

D:\Test\LargeFiles

📄 2. File Sizes and Types
Small Files (100 KB, 500 KB, 1024 KB) — up to 1,000 files, types: txt, csv, jpg, json, xml

Medium Files (10 MB, 50 MB, 100 MB) — up to 100 files, types: pdf, mp4, zip, txt, docx

Large Files (200 MB, 500 MB, 1 GB) — up to 20 files, types: bak, iso, tar, img, vhd

⚙️ Key Components
🛠️ New-RandomFile Function
This function creates a file filled with random bytes using:

powershell
Copy
Edit
$randomData = New-Object byte[] ($fileSizeKB)
[System.IO.File]::WriteAllBytes($filePath, $randomData)
Ensures file size is greater than 0 to avoid empty files.

🔁 Loop Behavior
Small files: 1000 files named file1.txt, file2.json, etc.

Medium files: 100 files named doc1.pdf, doc2.zip, etc.

Large files: 20 files named backup1.iso, backup2.tar, etc.

Each file has:

A random file type (extension)

A random size from the appropriate category

📝 How to Modify It
Change number of files: Adjust 1..1000, 1..100, or 1..20.

Change file sizes: Modify arrays $smallSizes, $mediumSizes, and $largeSizes.

Change file types: Edit $smallFileTypes, $mediumFileTypes, and $largeFileTypes.

✅ Use Cases
Disk I/O benchmarking

Antivirus behavior testing

Storage system performance

File management or deduplication tests

Let me know if you want to add features like:

Logging metadata (name, size, creation time)

Generating nested directories

Adding timestamps to file names
