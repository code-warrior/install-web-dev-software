function show () {
  echo -e "${BG_WHITE}${BLACK}> $* ${RESET}"
}

function inform () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_GREEN}${BLACK}${BOLD}>>>>  $1 ${RESET}"
}

function warn () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"
}

function fail () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_RED}${WHITE}${BOLD}>>>>  $1 ${RESET}"
}

function pause_awhile () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"

   read -r -p "${BG_YELLOW}${BLACK}${BOLD}Press <Enter> to continue.${RESET}"
}

function pause_and_warn () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"
   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>> ${RESET}"

   read -r -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Continue? [Yy] ${RESET} " -n 1 -r

   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      fail "Exiting..." true

      exit 1;
   fi
}
