from leakix import Client

client = Client(api_key="YOUR_API_KEY")
response = client.get_domain("leakix.net")
data = response.json()
print(data["services"])
print(data["leaks"])
