#!/bin/zsh

git add .

commit_number=$(git rev-list --count HEAD)
pdf_files=$(git diff --cached --name-only | grep .pdf | xargs -I % echo -e % | while read line; do echo $line; done)

commit_message="[#$commit_number] Add Books:"
for file in $pdf_files; do
  commit_message="$commit_message\n$file"
done

echo ${commit_message}

git commit -m "$commit_message"

git push