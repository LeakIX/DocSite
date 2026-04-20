from leakix import Client

client = Client(api_key="YOUR_API_KEY")
response = client.get_host("157.90.211.37")
data = response.json()
print(data["services"])
print(data["leaks"])
