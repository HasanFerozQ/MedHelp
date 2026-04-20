import sys

def check_file(filepath):
    with open(filepath, 'rb') as f:
        content = f.read()
    
    # Search for the FAQ header string in bytes
    target = b'<h2 style="text-align: center;">Common Questions</h2>'
    count = content.count(target)
    print(f"Occurrences of FAQ header: {count}")
    
    # Search for footer start
    footer_target = b'<footer class="site-footer">'
    footer_count = content.count(footer_target)
    print(f"Occurrences of footer: {footer_count}")

if __name__ == "__main__":
    check_file(r'C:\Users\Hasan-PC\Desktop\MedHelp\audit.html')
