if [ $(git diff --cached | grep -qi '’\|‘\|“\|”') ]; then
  :
else
  echo "You have a fucking smart quote in your commit dumbass."
  exit 1
fi
