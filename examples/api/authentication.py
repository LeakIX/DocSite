from leakix import Client

client = Client(api_key="YOUR_API_KEY")
response = client.get_domain("leakix.net")
print(response.json())
