#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
log_info "Bootstrapping SonarQube via Docker..."
if ! command -v docker &>/dev/null; then
  log_error "Docker is required to run SonarQube. Install Docker first."
  exit 1
fi
docker run -d --name sonarqube -p 9000:9000 sonarqube:10-community 2>/dev/null || log_warning "SonarQube container may already exist"
log_info "Waiting for SonarQube to start (this may take 60s)..."
sleep 60
log_success "SonarQube available at http://localhost:9000 (admin/admin)"
