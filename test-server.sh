curl localhost:8090/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
     "messages": [{"role": "user", "content": "what is the capital of london?"}],
     "temperature": 0.7
   }'