current_version=$Version
srcpart "https://raw.githubusercontent.com/nrjdalal/zrn/master/utils/utils.sh" 1 1
latest_version=$Version

if [[ "$current_version" == "$latest_version" ]]; then
  echo "you're using the latest verion $current_version"
else
  echo "newer version available $current_version -> $(tput setaf 2)$latest_version$(tput sgr0)"
  echo "run $(tput setaf 3)sudo zrn update$(tput sgr0) to upgrade"
fi
