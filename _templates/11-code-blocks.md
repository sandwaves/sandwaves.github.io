<!-- Plain: no syntax highlighting, no line numbers -->

```
This is a common code snippet, without syntax highlight and line number.
```

<!-- With a language: highlighting and line numbers -->

```bash
if [ $? -ne 0 ]; then
  echo "The command was not successful.";
fi;
```

<!-- With a filename shown in the header instead of the language -->

```sass
@import
  "colors/light-typography",
  "colors/dark-typography";
```
{: file='_sass/jekyll-theme-chirpy.scss'}

<!-- Hide line numbers -->

```shell
echo 'No line numbers!'
```
{: .nolineno }
