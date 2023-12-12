# new ssh sessions
# cat auth.log | egrep sshd.*opened
# echo $?

# additional test for auth.log
# cat auth.log | egrep sshd.*closed
# echo $?


PATTERN=New.*session







failure=0
if egrep -v "$PATTERN" should-match-auth.txt
then
echo "failure"
failure=1
else
echo "success on should match"
fi

failure=0
if egrep "$PATTERN" should-not-match-auth.txt
then
echo "failure"
failure=1
else
echo "success on should-not match"
fi

echo; echo "This is what I found"
egrep "$PATTERN" should-match-auth.txt

echo $?

exit $failure

