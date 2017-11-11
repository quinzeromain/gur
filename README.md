# gur

Usage : `gur [-clean] [-h] <config>`

Up-to-date the local git repositories according to the config file. 
By default the config file, repositories.txt, is defined at the same directory to this tool.

Parameters:
* \<config\>   : an absolute path of the config file 
* \-clean     : clean the logs directory
* \-h         : display this help


## The config file

The file contents correspond to the configuration of your git repositories. 
Each line of this file should have this following structure:

`[path] [branch]`

where 
* \[path\]   : aboslute path of your local repository you want to up-to-date
* \[branch\] : the name of the branch you want to up-to-date

Example

```C:\GitHub\Personal\Gur dev```
