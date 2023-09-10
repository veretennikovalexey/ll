# Examples of Bash Shell Features

## Learning Objectives
After completing this reading, you will be able to:
- List examples of metacharacters
- Use quoting to specify literal or special character meanings
- Implement input and output redirection
- Apply command substitution
- Describe applications for command line arguments

## Metacharacters
**Metacharacters** are characters having special meaning that the shell interprets as instructions.

| Metacharacter | Meaning |
|----|----|
| <code class="language-plaintext highlighter-rouge">#</code> | Precedes a comment |
| <code class="language-plaintext highlighter-rouge">;</code> | Command separator |
| <code class="language-plaintext highlighter-rouge">*</code> | Filename expansion wildcard |
| <code class="language-plaintext highlighter-rouge">?</code> | Single character wildcard in filename expansion |

### Pound <code class="language-plaintext highlighter-rouge">#</code>
The pound <code class="language-plaintext highlighter-rouge">#</code> metacharacter is used to represent comments in shell scripts or configuration files. Any text that appears after a <code class="language-plaintext highlighter-rouge">#</code> on a line is treated as a comment and is ignored by the shell.

&#x60;&#x60;&#x60;
#!/bin/bash

# This is a comment
echo &quot;Hello, world!&quot;  # This is another comment
&#x60;&#x60;&#x60;

Comments are useful for documenting your code or configuration files, providing context, and explaining the purpose of the code to other developers who may read it. It\&#x27;s a best practice to include comments in your code or configuration files wherever necessary to make them more readable and maintainable.

### Semicolon <code class="language-plaintext highlighter-rouge">;</code>
The semicolon <code class="language-plaintext highlighter-rouge">;</code> metacharacter is used to separate multiple commands on a single command line. When multiple commands are separated by a semicolon, they are executed sequentially in the order they appear on the command line.
&#x60;&#x60;&#x60;
$ echo &quot;Hello, &quot;; echo &quot;world!&quot;
Hello,
world!
&#x60;&#x60;&#x60;
As you can see from the example above, the output of each &#x60;echo&#x60; command is printed on separate lines and follows the same sequence in which the commands were specified.

The semicolon metacharacter is useful when you need to run multiple commands sequentially on a single command line.

### Asterisk <code class="language-plaintext highlighter-rouge">*</code>
The asterisk <code class="language-plaintext highlighter-rouge">*</code> metacharacter is used as a wildcard character to represent any sequence of characters, including none.
&#x60;&#x60;&#x60;
ls *.txt
&#x60;&#x60;&#x60;
In this example, &#x60;*.txt&#x60; is a wildcard pattern that matches any file in the current directory with a &#x60;.txt&#x60; extension. The &#x60;ls&#x60; command lists the names of all matching files.

### Question mark <code class="language-plaintext highlighter-rouge">?</code>
The question mark <code class="language-plaintext highlighter-rouge">?</code> metacharacter is used as a wildcard character to represent any single character.
&#x60;&#x60;&#x60;
ls file?.txt
&#x60;&#x60;&#x60;
In this example, &#x60;file?.txt&#x60; is a wildcard pattern that matches any file in the current directory with a name starting with &#x60;file&#x60;, followed by any single character, and ending with the &#x60;.txt&#x60; extension.

## Quoting

**Quoting** is a mechanism that allows you to remove the special meaning of characters, spaces, or other metacharacters in a command argument or shell script. You use quoting when you want the shell to interpret characters literally.

| Symbol | Meaning |
|--------|-----------------------------------------|
| <code class="language-plaintext highlighter-rouge">\</code>    | Escape metacharacter interpretation     |
| <code class="language-plaintext highlighter-rouge">" "</code>  | Interpret metacharacters within string  |
| <code class="language-plaintext highlighter-rouge">' '</code>  | Escape all metacharacters within string |

### Backslash <code class="language-plaintext highlighter-rouge">\</code>
The backslash character is used as an escape character. It instructs the shell to preserve the literal interpretation of special characters such as space, tab, and &#x60;$&#x60;. For example, if you have a file with spaces in its name, you can use backslashes followed by a space to handle those spaces literally:
&#x60;&#x60;&#x60;
touch file\ with\ space.txt
&#x60;&#x60;&#x60;

### Double quotes <code class="language-plaintext highlighter-rouge">" "</code>
When a string is enclosed in double quotes, most characters are interpreted literally, but metacharacters are interpreted according to their special meaning. For example, you can access variable values using the dollar &#x60;$&#x60; character:

&#x60;&#x60;&#x60;
$ echo &quot;Hello $USER&quot;
Hello &lt;username&gt;
&#x60;&#x60;&#x60;

### Single quotes <code class="language-plaintext highlighter-rouge">' '</code>
When a string is enclosed in single quotes, all characters and metacharacters enclosed within the quotes are interpreted literally. Single quotes alter the above example to produce the following output:

&#x60;&#x60;&#x60;
$ echo &#x27;Hello $USER&#x27;
Hello $USER
&#x60;&#x60;&#x60;
Notice that instead of printing the value of &#x60;$USER&#x60;, single quotes cause the terminal to print the string &#x60;&quot;$USER&quot;&#x60;.

## Input/Output redirection

| Symbol | Meaning                                  |
|------|--------------------------------------------|
| <code class="language-plaintext highlighter-rouge">></code>   | Redirect output to file, overwrite         |
| <code class="language-plaintext highlighter-rouge">>></code>  | Redirect output to file, append            |
| <code class="language-plaintext highlighter-rouge">2></code>  | Redirect standard error to file, overwrite |
| <code class="language-plaintext highlighter-rouge">2>></code> | Redirect standard error to file, append    |
| <code class="language-plaintext highlighter-rouge"><</code>   | Redirect file contents to standard input   |

**Input/output (IO) redirection** is the process of directing the flow of data between a program and its input/output sources.

By default, a program reads input from *standard input*, the keyboard, and writes output to *standard output*, the terminal. However, using IO redirection, you can redirect a program\&#x27;s input or output to or from a file or another program.

### Redirect output &#x60;&gt;&#x60;
This symbol is used to redirect the standard output of a command to a specified file.

&gt; &#x60;ls &gt; files.txt&#x60; will create a file called &#x60;files.txt&#x60; if it doesn\&#x27;t exist, and write the output of the &#x60;ls&#x60; command to it.

&gt; Warning: When the file already exists, the output overwrites all of the file\&#x27;s contents!

### Redirect and append output &#x60;&gt;&gt;&#x60;
This notation is used to redirect and append the output of a command to the end of a file. For example, 
&gt; &#x60;ls &gt;&gt; files.txt&#x60; appends the output of the &#x60;ls&#x60; command to the end of file &#x60;files.txt&#x60;, and preserves any content that already existed in the file.

### Redirect standard output &#x60;2&gt;&#x60;
This notation is used to redirect the standard error output of a command to a file. For example, if you run the ls command on a non-existing directory as follows,
&gt; &#x60;ls non-existent-directory 2&gt; error.txt&#x60; the shell will create a file called &#x60;error.txt&#x60; if it doesn\&#x27;t exist, and redirect the error output of the &#x60;ls&#x60; command to the file.

&gt; Warning: When the file already exists, the error message overwrites all of the file\&#x27;s contents!

### Append standard error &#x60;2&gt;&gt;&#x60;
This symbol redirects the standard error output of a command and appends the error message to the end of a file without overwriting its contents.
&gt; &#x60;ls non-existent-directory 2&gt;&gt; error.txt&#x60; will append the error output of the &#x60;ls&#x60; command to the end of the &#x60;error.txt&#x60; file.

### Redirect input &#x60;&lt;&#x60;
This symbol is used to redirect the standard input of a command from a file or another command. For example,
&gt; &#x60;sort &lt; data.txt&#x60; will &#x60;sort&#x60; the contents of the &#x60;data.txt&#x60; file.


## Command Substitution
**Command substitution** allows you to run command and use its output as a component of another command\&#x27;s argument. Command substitution is denoted by enclosing a command in either backticks (**\&#x60;command\&#x60;**) or using the &#x60;$()&#x60; syntax. When the encapsulate command is executed, its output is substituted in place, and it can be used as an argument within another command. This is particularly useful for automating tasks that require the use of a command\&#x27;s output as input for another command. 

For example, you could store the path to your current directory in a variable by applying command substitution on the &#x60;pwd&#x60; command, then move to another directory, and finally return to your original directory by invoking the &#x60;cd&#x60; command on the variable you stored, as follows:  
&#x60;&#x60;&#x60;
$ here &#x3D; $(pwd)
$ cd path_to_some_other_directory
$ cd $here
&#x60;&#x60;&#x60;


## Command Line Arguments
**Command line arguments** are additional inputs that can be passed to a program when the program is run from a command line interface. These arguments are specified after the name of the program, and they can be used to modify the behavior of the program, provide input data, or provide output locations. Command line arguments are used to pass arguments to a shell script.

For example, the following command provides two arguments, arg1, and arg2, that can be accessed from within your Bash script:
&#x60;&#x60;&#x60;
$ ./MyBashScript.sh arg1 arg2
&#x60;&#x60;&#x60;

## Summary
In this reading, you learned that:
- Metacharacters such as &#x60;#&#x60;, &#x60;;&#x60;, &#x60;*&#x60;, and &#x60;?&#x60; are characters that the shell interprets with special meanings
- Quoting allows you to ensure any special characters, spaces, or other metacharacters are interpreted literally by the shell
- Input/output redirection redirects a program\&#x27;s input or output to/from a file
- Command substitution allows you to use the output of a command as an argument for another command
- Command line arguments can be used to pass information to a shell script
