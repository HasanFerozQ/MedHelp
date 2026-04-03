from PIL import Image
import os

icons_dir = "C:/Users/Hasan-Pc/Desktop/MedHelp/icons"
ico_path = os.path.join(icons_dir, "favicon.ico")

try:
    img = Image.open(ico_path)
    img.resize((16, 16)).save(os.path.join(icons_dir, "icon16.png"))
    img.resize((48, 48)).save(os.path.join(icons_dir, "icon48.png"))
    img.resize((128, 128)).save(os.path.join(icons_dir, "icon128.png"))
    print("Icons updated successfully.")
except Exception as e:
    print('Error:', e)
