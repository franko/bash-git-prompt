# bash-git-prompt

A fast git prompt that show the branch filename without calling any external command.

## What it does

It prints a nice prompt to show the git branch you are actually in if you are inside a git working directory.

## Why

It is very useful to have immediately the information about the branch you are currently in.
It is the same principle of showing the current working directory in the prompt.

To be really tolerable it has to be **fast** because the code it is called every time the prompt is shown.
If it is slow it can be quickly very annoying and this limit its usefulness.
in addition, on Windows, spawning a process is very slow and the delay quickly becomes intolerable.

In order to be fase the script does not call any external command, including git.
It only use bash constructs and internal commands.
The information about the git branch is found simply reading the file .git/HEAD.

## Limitations

It does not display other information except the branch you are in and it doesn't call "git fetch" for you.
We consider that git fetch is a command that should be given explicitly.

## How to use

Copy the bash code into your ".bashrc" file in your HOME directory.
