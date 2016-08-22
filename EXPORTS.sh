# :vim set filetype=bash : #

_base="${PWD}/gcc-arm-none-eabi-4_9-2015q3"

if [[ ! -d "$_base" ]]
then
  echo "Source this file from the directory containing gcc-arm-none-eabi-4_9-2015q3"
else
  [[ ! "$PATH" =~ "${_base}/bin" ]] &&
    PATH+=":${_base}/bin"
  export LD_LIBRARY_PATH="${_base}/lib"
  export LD_INCLUDE_PATH="${_base}/arm-none-eabi/include"
fi

unset _base
