$env:LLM_OLLAMA_BASE_URL = "http://host.docker.internal:11434"
$env:LLM_API_KEY = "ollama"

docker rm -f openhands-app

docker run --rm --network=host --pull=always `
    -e SANDBOX_RUNTIME_CONTAINER_IMAGE=docker.all-hands.dev/all-hands-ai/runtime:0.35-nikolaik `
    -e LOG_ALL_EVENTS=true `
    -e LLM_OLLAMA_BASE_URL=$env:LLM_OLLAMA_BASE_URL `
    -e LLM_API_KEY=$env:LLM_API_KEY `
    -v /var/run/docker.sock:/var/run/docker.sock `
    -v $env:USERPROFILE/.openhands-state:/.openhands-state `
    --add-host host.docker.internal:host-gateway `
    --name openhands-app `
    docker.all-hands.dev/all-hands-ai/openhands:0.35
