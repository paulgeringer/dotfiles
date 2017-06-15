git diff --cached | grep -qi "’\|‘\|“\|”"
if [ $? -eq 1 ]; then
  :
else
  echo "You have a fucking smart quote in your commit dumbass."
  exit 1
fi
