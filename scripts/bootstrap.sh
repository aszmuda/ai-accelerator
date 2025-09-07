#!/bin/bash
set -e

# Default values
ARGO_NS="openshift-gitops"

source "$(dirname "$0")/functions.sh"
source "$(dirname "$0")/util.sh"
source "$(dirname "$0")/command_flags.sh" "$@"

bootstrap_cluster(){

  base_dir="bootstrap/overlays"

  # Check if bootstrap_dir is already set
  if [ -n "$BOOTSTRAP_DIR" ]; then
    bootstrap_dir=$BOOTSTRAP_DIR
    test -n "$base_dir/$bootstrap_dir";
    echo "Using bootstrap folder: $bootstrap_dir"
  else
    echo
    PS3="Please enter a number to select a bootstrap folder: "
    
    select bootstrap_dir in $(basename -a $base_dir/*/); 
    do
        test -n "$base_dir/$bootstrap_dir" && break;
        echo ">>> Invalid Selection";
    done

    echo
    echo "Selected: ${bootstrap_dir}"
    echo
  fi

  check_branch
  check_repo
  
  echo "Apply overlay to override default instance"
  kustomize build "${base_dir}/${bootstrap_dir}" | oc apply -f -

  route=$(oc get route openshift-gitops-server -o jsonpath='{.spec.host}' -n ${ARGO_NS})
  echo
  echo "GitOps has successfully deployed!  Check the status of the sync here:"
  echo "https://${route}"
}

# Verify CLI tooling
check_bin oc
check_bin kustomize

# Verify OCP login
check_oc_login

# Execute bootstrap functions
bootstrap_cluster
