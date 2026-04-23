#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

log_info "Validating SonarQube configuration assets..."

if [ -f sonarqube/sonar-project.properties ]; then
  log_success "sonar-project.properties found"
else
  log_error "sonar-project.properties missing"
fi

if grep -q "sonar.projectKey" sonarqube/sonar-project.properties; then
  log_success "sonar.projectKey configured"
else
  log_error "sonar.projectKey missing"
fi

log_success "SonarQube assets validation complete"
