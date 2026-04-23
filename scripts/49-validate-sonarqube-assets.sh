#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Validating SonarQube configuration assets..."
[ -f sonarqube/sonar-project.properties ] && log_success "sonar-project.properties found" || log_error "sonar-project.properties missing"
grep -q "sonar.projectKey" sonarqube/sonar-project.properties && log_success "sonar.projectKey configured" || log_error "sonar.projectKey missing"
log_success "SonarQube assets validation complete"
