LAMBDA_FUNCTION_NAME=alexawithiot

git add -A
git commit -m "$1"
git push -u origin master

rm -f temp
mkdir -p temp

zip -r temp/app.zip ./ -x "*.sh" -x temp -x test -x .git -x gitignore
aws lambda update-function-code --function-name $LAMBDA_FUNCTION_NAME --zip-file fileb://temp/app.zip
