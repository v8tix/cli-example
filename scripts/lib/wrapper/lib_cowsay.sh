dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
. ""${dir}"/common.sh"

#######################################
# Prints the actual date in the given format %Y-%m-%dT%H:%M:%S%z.
# Globals:
#   None.
# Arguments:
#   None.
# Returns:
#   {date_format} String.
#######################################
date_format(){
  echo "$(date +'%Y-%m-%dT%H:%M:%S%z')"
}

#######################################
# Prints an error description.
# Globals:
#   None.
# Arguments:
#   ${1} The error code.
#   ${2} The error description.
# Returns:
#   {date, error_code, description} String.
#######################################
err() {
  echo "{\"date\":\""$(date_format)"\", \"error_code\":"${1}", \"description\":\""${2}\""}"
}

#######################################
# Sample wrapper to the cowsay executable.
# Globals:
#   ERROR_CODE
#   INVALID_NUMBER_PARAMETERS_CODE
#   INVALID_NUMBER_PARAMETERS
#   NO_ERRORS_CODE
#   UNKNOWN_FUNCTION_OPTION
#   UNKNOWN_FUNCTION_OPTION_CODE
# Arguments:
#   -msg  <code>
# Returns:
# ${error_msg} String.
#   ERROR_CODE
#   INVALID_NUMBER_PARAMETERS_CODE
#   INVALID_NUMBER_PARAMETERS
#   NO_ERRORS_CODE
#   UNKNOWN_FUNCTION_OPTION
#   UNKNOWN_FUNCTION_OPTION_CODE
#######################################
cowsay_wrapper(){
  if [[ $# -eq 2 ]]; then
    while (( "$#" )); do
      case "${1}" in
        -msg)
          shift
          msg="${1}"
          ;;
        *)
          msg="${UNKNOWN_FUNCTION_OPTION}"
          error_msg="$(err "${UNKNOWN_FUNCTION_OPTION_CODE}" "${msg}")"
          usage_cowsay_wrapper "${error_msg}"
          return ${UNKNOWN_FUNCTION_OPTION_CODE}
          ;;
      esac

      shift

    done

    cowsay -f "tux" ${msg}

  else

    msg="${INVALID_NUMBER_PARAMETERS}"
    error_msg="$(err "${INVALID_NUMBER_PARAMETERS_CODE}" "${msg}")"
    usage_cowsay_wrapper "${error_msg}"
    return "${INVALID_NUMBER_PARAMETERS_CODE}"

  fi

}

usage_cowsay_wrapper() {
  echo -e "\n"
  echo -e "cowsay_wrapper ${1}\n"
  echo -e 'Usage: cowsay_wrapper -<OPTIONS>\n'
  echo -e '    OPTIONS     PARAMS              DESCRIPTION\n'
  echo -e '    -msg        <msg>               A message to display.\n'
}