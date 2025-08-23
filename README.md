# Project: PZ Mothership

## Overview
PZ Mothership is a modular and scalable application designed to manage and monitor various services and resources. It leverages Docker for containerization, Prometheus and Grafana for monitoring, and supports auxiliary services like Redis and Node Exporter.

## Features
- **MongoDB Integration**: Configurable database setup for persistent data storage.
- **Monitoring Stack**: Includes Prometheus, Grafana, Node Exporter, NVIDIA DCGM Exporter, and cAdvisor for comprehensive monitoring.
- **Redis Support**: Provides caching and message brokering capabilities.
- **Dockerized Environment**: Simplifies deployment and scaling using Docker Compose.

## Prerequisites
- Docker
- Docker Compose
- Python 3.8+

## Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd pz_mothership
```

### 2. Configure Environment Variables
Copy the `.env.template` file to `.env` and fill in the required values:
```bash
cp .env.template .env
```

### 3. Install Python Dependencies
Use `pip` or `pip-compile` to install dependencies:
```bash
pip install -r requirements.txt
```

### 4. Start Services
Use Docker Compose to start all services:
```bash
docker-compose up -d
```

## Directory Structure
```
.
├── deployments/          # Deployment configurations (e.g., docker-compose.yml)
├── scripts/              # Utility scripts for development and testing
├── src/                  # Application source code
├── tests/                # Unit and integration tests
├── requirements.txt      # Python dependencies
├── .env.template         # Environment variable template
└── README.md             # Project documentation
```

## Usage
- Access **Grafana** at `http://localhost:<grafana-port>`.
- Access **Prometheus** at `http://localhost:<prometheus-port>`.
- MongoDB runs on `localhost:<mongo-port>`.

## Testing
Run the test suite using:
```bash
./scripts/run_tests.sh
```

## Contributing
1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Open a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments
- [Docker](https://www.docker.com/)
- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)
