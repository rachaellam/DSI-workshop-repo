#!/bin/bash

# function love {
# 	echo "name"
# 	return
# }

# function hey {
# 	echo "is"
# 	return
# }
# # program starts here

# echo "My"
# love
# hey 
# echo "Apichat"

# tomorrow="Holiday"
# leisure="my favourite day."
# toBE="is"

# function toBE {
#  	echo $toBE
#  	return
# }

# echo $tomorrow 
# toBE
# echo $leisure

# Exam=0 
# fx_1 () {
# 	local Exam
# 	Exam=3
# 	echo "fx_1: Exam = $Exam"
# }

# fx_2 () {
# 	local Exam
# 	Exam=2
# 	echo "fx_2: Exam = $Exam"
# }

# echo "global: Exam = $Exam"
# fx_1
# echo "global: Exam = $Exam"
# fx_2
# echo "global: Exam = $Exam"

# Exam=0 
# fx_1 () {
# 	Exam=3
# 	echo "fx_1: Exam = $Exam"
# }

# fx_2 () {
# 	Exam=2
# 	echo "fx_2: Exam = $Exam"
# }

# echo "global: Exam = $Exam"
# fx_1
# echo "global: Exam = $Exam"
# fx_2
# echo "global: Exam = $Exam"

print_params () {
	echo "\$1 = $1"
	echo "\$2 = $2"
	echo "\$3 = $3"
	echo "\$4 = $4"
}

pass_params () {
	echo -e "\n" '$* :'; print_params $*
	echo -e "\n" '"$*" :'; print_params "$*"  
	echo -e "\n" '$@ :'; print_params $@  	
	echo -e "\n" '"$@" :'; print_params "$@"  
}

pass_params "words" "words with spaces"