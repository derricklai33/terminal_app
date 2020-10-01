# Terminal App Assignment

## Installation and Setup

1. Install Ruby, recommended using [asdf](https://asdf-vm.com/)

2. Install [Git](https://git-scm.com/downloads)

3. `git clone` to your home directory

```bash
git clone https://github.com/derricklai33/terminal_app.git ~/terminal_app
```
4. Run `setup` executable file

```bash
~/terminal_app/src/bin/setup
```
5. Open bash profile

For MAC users:
```bash
open ~/.bash_profile
```

For Linux users:
```bash
~/.profile
```
6. Add the following line

For MAC users:
```bash
export PATH=$PATH:$HOME/terminal_app/src/bin
```

For Linux users:
```bash
PATH=$PATH:$HOME/terminal_app/src/bin
```

7. Restart terminal to ensure `~/.bash_profile` or `~/.profile` is loaded into terminal

8. Run the `hungry` executable from anywhere in the terminal