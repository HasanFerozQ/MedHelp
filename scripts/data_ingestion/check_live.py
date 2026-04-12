import requests
url = "https://www.medihelp.live/tabs/codesearch/codesearch.js"
r = requests.get(url)
print(r.status_code)
content = r.text
print(content[:200])
print("-----")
print("Smart Dot Injection" in content)
print("Array.from(new Set" in content)
