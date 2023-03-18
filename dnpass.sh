pass=$(fzf << EOF
TEST1
TEST2
TEST3
EOF)

tc() { read -rp 'Enter Your Password: ' password; printf %s "$1" | xxd -r -c 256 -ps | openssl enc -d -aes-256-ctr -pbkdf2 -k "$password"; }

case $pass in
	TEST1) tc "53616c7465645f5f0b1923778b8217eece6451db71959221574a7a3024bc70033dd3ac53ae8335f0b41707aff71ddb9267744988b0cde58b55dc301dc87efbad44f62a77363a01e1bb90be8c01f0c761a59de6394c9062d868b0e5c74737d1da1b886e616d2f10bb9203ae64fe3271af84d5ab91fedaca082278ba415e98737a";;
	TEST2) tc "53616c7465645f5fe7cc1b67a1c296748542af334b1ef590046e092c4d4bbd2ade1d8e0a5e355aa1e2882b45544a3c375c893017e1e9c5deff01824e574dc79f6847b169bfdf1f3a201f9ef6be3b5561a63e82a01dc78001b4eb5d46364b9f9ead48a2d91b4514e9d330d4071793c6a78d45ca85ff2f44d17a0226bb39193f04";;
	TEST3) tc "53616c7465645f5f2fdc1cb1f55e211b6ccb549708a64bd85a652e417f8c8c63314c019889ab657e1c3637bbcc1bfb67d815cec8ff0cbbddc83c97ae34cb439fe9088b37a2534d8a196716eb0a63f0ebc958de871f8f52d5a70f7e6fc4bffcb7928ef6ed7b46cf29ce16630119a3571e9301815bd3dab8726ce9adfc59309baa";;
esac
