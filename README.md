# bootstraping
Development environment setup.

## SSH
* Generating SSH: [GitHub](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* Use multiple SSH keys: [link](https://gist.github.com/jexchan/2351996)

```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa_idf
  # possible multiple public keyy
```

List the keys
```
ssh-add -l
```

## Emacs
To update the emacs to newest version.
```
brew install emacs
```
Need to restart the computer.

Expecting breaking changes in newer versions of tools
