
# Import the Python SDK
import google.generativeai as genai

GOOGLE_API_KEY = "AIzaSyCO2IGhu4JYzj8ZhyCcv9VnxnPwu22W4VI"
genai.configure(api_key=GOOGLE_API_KEY)
model = genai.GenerativeModel('gemini-pro')
response = model.generate_content("Write a story about a magic backpack.")
print(response.text)