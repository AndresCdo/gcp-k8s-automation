#!/bin/bash

# This program is for automate Ansible Project.


decorate() {
  eval "
    _inner_$(typeset -f "$1")
    $1"'() {
      echo >&2 "Calling function '"$1"' with $# arguments"
      _inner_'"$1"' "$@"
      local ret=$?
      echo >&2 "Function '"$1"' returned with exit status $ret"
      return "$ret"
    }'
}


main() {
    if [ "$#" != "1" ]; then
        echo "You must provide one arg.";
	exit 1
    else
        packages=("docker" "kubernetes")
	folders=("tasks" "handlers" "files" "vars" "defaults")
	echo "The argument is $1";
	case $1 in
	    init)
              echo "Creating Ansible project...";
	      touch playbook.yml
	      for package in ${packages[@]}; do
	        for folder in ${folders[@]}; do
                  mkdir -p roles/$package/$folder
		  touch  roles/$package/$folder/main.yml
                done
              done
	      exit 0
	    ;;
	    purge)
	      echo "Removing Ansible project..."
              rm -f playbook.yml
              rm -r roles/
              exit 0
            ;;
	 esac
	 echo "Enter a valid arg."
	 exit 1
    fi
}

decorate main
main "$@"
