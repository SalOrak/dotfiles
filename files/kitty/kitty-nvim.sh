
tabs=$(kitty @ ls)

echo $(echo $tabs | jq '.[0]')


