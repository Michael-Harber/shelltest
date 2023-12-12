# Finding lines that start with + or -
# cat plus-minus.txt | egrep ^[+\-]
# echo $?

# additional test for pattern.txt
# cat pattern.txt | egrep [+\-]
# echo $?


# negative test for pattern.txt
# cat pattern.txt | egrep +



PATTERN=^[+-]





failure=0
if egrep -v "$PATTERN" should-match-plusminus.txt
then
echo "failure"
failure=1
else
echo "success on should-match"
fi

failure=0
if egrep  "$PATTERN" should-not-match-plusminus.txt
then
echo "failure"
failure=1
else
echo "success on should-not-match"
fi

echo; echo "This is what I found"
egrep "$PATTERN" should-match-plusminus.txt

echo $?

exit $failure

