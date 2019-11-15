#!/usr/bin/env bash

function ensureSet() {
    local variable=$1
    local description=$2

    if [[ -n "${variable}" ]] ; then
        return 0
    else
        echo "${description} is not set"
        return 1
    fi
}

function verifySHASUM() {
	local filepath=$1
	local expected=$2

	local actual
	actual=$(sha256sum "${filepath}" | awk '{print $1}')

	if [[ "${expected}" == "${actual}" ]] ; then
		return 0
	else
		echo "SHA mismatch for ${filepath}:"
		echo "  Expected: ${expected}"
		echo "       Got: ${actual}"
		return 1
	fi
}
