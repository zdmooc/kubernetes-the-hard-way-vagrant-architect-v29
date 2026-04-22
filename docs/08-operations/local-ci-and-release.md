# Local CI and Release Workflow

## Purpose
Provide a repeatable local workflow before publishing the repository or tagging a release.

## Pipeline outline
1. shell linting / syntax checks
2. documentation presence checks
3. script executable bit verification
4. validation profile execution
5. package release zip
6. write release notes

## Recommended local sequence
```bash
make validate
bash scripts/37-ci-local.sh
bash scripts/36-package-release.sh
```

## Handover outcome
A release should include:
- source tree
- packaged zip
- release notes
- validation output
- evidence sample
