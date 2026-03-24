Each service from `deployments/docker-compose.yml` has been split into its own folder:

- `minio`
- `mongo`
- `prometheus`
- `grafana`
- `node_exporter`
- `nvidia-dcgm-exporter`
- `cadvisor`
- `redis`
- `portainer`
- `portainer-agent`
- `ollama`
- `openwebui`

## Shared environment

All `deploy.sh` scripts source the same shared env file:

- `../../.env.dev`

Run a service deployment from its folder:

```bash
cd services/minio
./deploy.sh
```

Deploy all services or selected services from one script:

```bash
cd services
./deploy.sh all
./deploy.sh minio mongo
./deploy.sh --list
```
