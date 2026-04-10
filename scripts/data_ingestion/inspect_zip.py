import zipfile
import os

zip_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scripts\data_ingestion\data\mpfs_rvu.zip"
if os.path.exists(zip_path):
    with zipfile.ZipFile(zip_path, 'r') as zf:
        print("Contents of mpfs_rvu.zip:")
        for name in zf.namelist():
            print(f"  - {name} ({zf.getinfo(name).file_size / 1024:.1f} KB)")
else:
    print(f"ZIP not found at {zip_path}")
