# RBAC, Admission and Audit Bootstrap

## Goal
Add a first enterprise-grade governance layer to the cluster.

## Scope in V14
- create base namespaces,
- apply Pod Security labels,
- deploy RBAC roles and bindings,
- apply an audit policy file for kube-apiserver,
- install a sample ValidatingAdmissionPolicy,
- deploy ServiceAccount examples with controlled token mounting.

## Execution order
1. create namespaces,
2. apply namespace labels,
3. apply RBAC manifests,
4. copy audit policy to controllers,
5. update kube-apiserver manifest / service unit if required,
6. apply admission policies,
7. validate with positive and negative test cases.

## Validation examples
```bash
kubectl auth can-i get pods --as=system:serviceaccount:smoke:viewer -n smoke
kubectl auth can-i create deployments --as=system:serviceaccount:smoke:viewer -n smoke
kubectl get validatingadmissionpolicy
kubectl get events -A --sort-by=.lastTimestamp | tail -n 20
```

## Expected outcome
The repository should now demonstrate not only cluster construction, but also the first layer of access governance and policy enforcement.
