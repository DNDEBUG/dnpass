# dnpass
Simple non-dumb password manager

### Dependences  
*fzf*  
*[xxd](https://github.com/vim/vim/tree/master/src/xxd)*  
*openssl* (You probably already have this one)  
  
## How to make it work  
  
### Creating your password  
  
**Create a txt file with your informations**  
Example:  
```
Email: your@email.here
Password: yourpassword
Info: Some extra information
```
  
**Encrypt it with openssl**  

```
openssl enc -e -aes-256-ctr -pbkdf2 -in password_file.txt -out password_file.enc
```
  
**Use xxd to turn it into text**  

```
xxd -c 100000000 -ps password_file.enc > hex_data.txt
```
  
You can tweak the settings for openssl and xxd  
but you have to match them in the script  
  
### Adding the password file to the script  
  
Start by editing this part  
```
pass=`fzf << EOF
TEST1
TEST2
TEST3
EOF`
```
  
You add your accounts like this for example  
  
```
pass=$(fzf << EOF
Bank
Facebook
Github
EOF)
```
  
Then go to the ```case``` part  
  
```
case $pass in
	Bank) tc "Copy the text from the file you created with xxd to here (hex_data.txt for this example)";;
	Facebook) tc "Same as a above";;
	Github) tc "Same as above";;
esac
```
  
when you run the script it will ask you to select what password file you want to open  
when you select it will ask for the password to decrypt it  
  
# I HOPE YOU UNDERSTAND
